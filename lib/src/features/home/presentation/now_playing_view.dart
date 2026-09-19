import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/src/features/home/data/repos/home_repository_impl.dart';
import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/presentation/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NowPlayingView extends ConsumerStatefulWidget {
  const NowPlayingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NowPlayingViewState();
}

class _NowPlayingViewState extends ConsumerState<NowPlayingView> {
  late PagingController<int, Movie> pagingController;
  bool isAvailableNextPage = true;

  @override
  void initState() {
    pagingController = PagingController<int, Movie>(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      fetchMovies(page: pageKey);
    });
    super.initState();
  }

  void fetchMovies({int page = 1}) async {
    try {
      final movies = await ref
          .read(homeRepositoryProvider)
          .getNowPlayingMovies(page: page);
      isAvailableNextPage = movies.page < movies.totalPages;

      final nextPageKey = page + 1;
      if (isAvailableNextPage) {
        pagingController.appendPage(movies.results, nextPageKey);
      } else {
        pagingController.appendLastPage(movies.results);
      }
    } catch (e) {
      isAvailableNextPage = false;
      pagingController.error = (e as Failure).message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Movie>(
      pagingController: pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, movie, index) {
          return MovieCard(movie);
        },
      ),
    );
  }
}
