import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';

abstract class HomeRepository {
  //
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> searchMovies(String query);

  //
  Future<List<TVShow>> getPopularTvShows();
  Future<List<TVShow>> getNowPlayingTvShows();
}
