import 'package:elemes_flix/extensions/navigation_extension.dart';
import 'package:elemes_flix/src/features/Wishlist/presentation/wishlist_page.dart';
import 'package:elemes_flix/src/features/home/presentation/home_tabbar_widget.dart';
import 'package:elemes_flix/src/features/home/presentation/content_list_view.dart';
import 'package:elemes_flix/src/features/home/presentation/providers/search_controller_provider.dart';
import 'package:elemes_flix/src/features/home/presentation/providers/searchbar_toggle_provider.dart';
import 'package:elemes_flix/src/features/home/presentation/providers/tabbar_provider.dart';
import 'package:elemes_flix/src/features/home/presentation/search_result_view.dart';
import 'package:elemes_flix/types/tabbar_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:elemes_flix/extensions/int_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset('assets/images/wordmark_logo.png', height: 100),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_rounded),
            onPressed: () {
              context.push(WishlistPage());
            },
          ),
          // 4.toWidthGap(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ref.read(showSearchbarProvider.notifier).state = true;
              ref.read(searchBarControllerProvider).searchContents('');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          20.toHeightGap(),
          HomeTabbarMenu(),
          16.toHeightGap(),
          Expanded(child: _Body()),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSearch = ref.watch(showSearchbarProvider);

    if (showSearch) {
      return const SearchResultView();
    }

    final tabIndex = ref.watch(homeTabbarProvider).tabIndex;

    switch (tabIndex) {
      case 0:
        return ContentsListView(
          key: const ValueKey('now_playing_movies'),
          tabbarType: TabbarContents.nowPlayingMovies,
        );

      case 1:
        return ContentsListView(
          key: const ValueKey('popular_movies'),
          tabbarType: TabbarContents.popularMovies,
        );

      case 2:
        return ContentsListView(
          key: const ValueKey('now_playing_tv'),
          tabbarType: TabbarContents.nowPlayingTv,
        );

      case 3:
        return ContentsListView(
          key: const ValueKey('popular_tv'),
          tabbarType: TabbarContents.popularTvShows,
        );
      //
      default:
        return Container();
    }
  }
}
