import 'package:elemes_flix/extensions/int_extensions.dart';
import 'package:elemes_flix/src/features/home/presentation/providers/searchbar_toggle_provider.dart';
import 'package:elemes_flix/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                //
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, right: 8),
                hintText: 'Search Movies, TV shows, Actors',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: AppColors.textColor.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
          12.toWidthGap(),
          IconButton(
            onPressed: () {
              ref.read(showSearchbarProvider.notifier).state = false;
            },
            icon: const Icon(Icons.close, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
