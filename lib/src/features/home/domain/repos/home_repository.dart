import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';

abstract class HomeRepository {
  //
  Future<PagedResponse<Movie>> getPopularMovies({int page = 1});
  Future<PagedResponse<Movie>> getNowPlayingMovies({int page = 1});
  Future<PagedResponse<Movie>> searchMovies(String query, {int page = 1});

  //
  Future<PagedResponse<TVShow>> getPopularTvShows({int page = 1});
  Future<PagedResponse<TVShow>> getNowPlayingTvShows({int page = 1});
}
