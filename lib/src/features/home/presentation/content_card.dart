import 'package:elemes_flix/config/api_config.dart';
import 'package:elemes_flix/extensions/int_extensions.dart';
import 'package:elemes_flix/extensions/text_style_extension.dart';
import 'package:elemes_flix/src/features/Wishlist/presentation/providers/wishlist_controller.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:elemes_flix/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentCard extends StatelessWidget {
  const ContentCard(this.mediaItem, {super.key});

  final MediaItem mediaItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                AppApiConfig.imagePrefixUrl + mediaItem.posterPath!,
                fit: BoxFit.cover,
              ),
            ),
            _StarRating(mediaItem.voteAverage ?? 0),
            Align(
              alignment: Alignment.topRight,
              child: _BookmarkButton(mediaItem),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookmarkButton extends ConsumerWidget {
  const _BookmarkButton(this.media, {super.key});
  final MediaItem media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWishlisted = ref
        .watch(wishlistControllerProvider.notifier)
        .isBookmarked(media.id!);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
        color: Colors.black.withValues(alpha: 0.75),
      ),
      child: IconButton(
        onPressed: () {
          if (isWishlisted) {
            ref
                .read(wishlistControllerProvider.notifier)
                .removeMedia(media.id!);
          } else {
            ref.read(wishlistControllerProvider.notifier).addMedia(media);
          }
        },
        icon: isWishlisted
            ? const Icon(Icons.bookmark_added_rounded)
            : const Icon(Icons.bookmark_add_outlined),
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  const _StarRating(this.rating, {super.key});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
        color: Colors.black.withValues(alpha: 0.75),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: AppColors.ratingColor),
          8.toWidthGap(),
          Text(rating.toStringAsFixed(1)).mediumWeight(),
        ],
      ),
    );
  }
}
