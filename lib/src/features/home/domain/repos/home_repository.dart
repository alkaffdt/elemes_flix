import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';

abstract class HomeRepository {
  //
  Future<PagedResponse<MediaItem>> getPopularMovies({int page = 1});
  Future<PagedResponse<MediaItem>> getNowPlayingMovies({int page = 1});
  Future<PagedResponse<MediaItem>> searchContent(String query, {int page = 1});

  //
  Future<PagedResponse<MediaItem>> getPopularTvShows({int page = 1});
  Future<PagedResponse<MediaItem>> getNowPlayingTvShows({int page = 1});
}
