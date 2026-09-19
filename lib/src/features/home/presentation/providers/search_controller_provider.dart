import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/src/features/home/data/repos/home_repository_impl.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:elemes_flix/src/features/home/domain/repos/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final searchBarControllerProvider = Provider<SearchBarController>((ref) {
  return SearchBarController(ref.watch(homeRepositoryProvider));
});

class SearchBarController {
  SearchBarController(this.repository);

  final HomeRepository repository;

  final PagingController<int, MediaItem> pagingController = PagingController(
    firstPageKey: 0,
  );

  bool isAvailableNextPage = false;

  void searchContents(String keyword) {
    fetchContents(keyword);
    pagingController.refresh();
    //
    pagingController.addPageRequestListener((pageKey) {
      fetchContents(keyword, page: pageKey);
    });
  }

  void fetchContents(String keyword, {int page = 1}) async {
    try {
      final contents = await repository.searchContent(keyword, page: page);
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
}
