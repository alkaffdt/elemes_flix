import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/data/repos/home_repository_impl.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:elemes_flix/src/features/home/presentation/content_card.dart';
import 'package:elemes_flix/src/features/home/presentation/providers/search_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:elemes_flix/types/tabbar_contents.dart';

class SearchResultView extends ConsumerStatefulWidget {
  const SearchResultView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NowPlayingViewState();
}

class _NowPlayingViewState extends ConsumerState<SearchResultView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, MediaItem>(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      pagingController: ref.watch(searchBarControllerProvider).pagingController,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, movie, index) {
          return ContentCard(movie);
        },
      ),
    );
  }
}
