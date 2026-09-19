import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/data/repos/home_repository_impl.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:elemes_flix/src/features/home/presentation/content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:elemes_flix/types/tabbar_contents.dart';

class ContentsListView extends ConsumerStatefulWidget {
  const ContentsListView({
    super.key,
    this.tabbarType = TabbarContents.nowPlayingMovies,
  });

  final TabbarContents tabbarType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NowPlayingViewState();
}

class _NowPlayingViewState extends ConsumerState<ContentsListView> {
  late PagingController<int, MediaItem> pagingController;
  bool isAvailableNextPage = true;

  @override
  void initState() {
    pagingController = PagingController<int, MediaItem>(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      fetchContents(page: pageKey);
    });
    super.initState();
  }

  void fetchContents({int page = 1}) async {
    try {
      final contents = await fetchRelevantContents();
      isAvailableNextPage = contents.page < contents.totalPages;

      final nextPageKey = page + 1;
      if (isAvailableNextPage) {
        pagingController.appendPage(contents.results, nextPageKey);
      } else {
        pagingController.appendLastPage(contents.results);
      }
    } catch (e) {
      isAvailableNextPage = false;
      pagingController.error = (e as Failure).message;
    }
  }

  Future<PagedResponse<MediaItem>> fetchRelevantContents() {
    final repository = ref.read(homeRepositoryProvider);

    switch (widget.tabbarType) {
      case TabbarContents.nowPlayingMovies:
        return repository.getNowPlayingMovies(page: 1);

      case TabbarContents.popularMovies:
        return repository.getPopularMovies(page: 1);

      case TabbarContents.nowPlayingTv:
        return repository.getNowPlayingTvShows(page: 1);

      case TabbarContents.popularTvShows:
        return repository.getPopularTvShows(page: 1);

      default:
        return Future.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, MediaItem>(
      pagingController: pagingController,
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
