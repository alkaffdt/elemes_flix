import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';

abstract class HomeRepositoryDatasource {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> searchMovies(String query);

  //
  Future<List<TVShow>> getPopularTvShows();
  Future<List<TVShow>> getNowPlayingTvShows();
}

class HomeRepositoryDatasourceImpl implements HomeRepositoryDatasource {
  HomeRepositoryDatasourceImpl();

  @override
  Future<List<Movie>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

  @override
  Future<List<TVShow>> getPopularTvShows() {
    // TODO: implement getPopularTvShows
    throw UnimplementedError();
  }

  @override
  Future<List<TVShow>> getNowPlayingTvShows() {
    // TODO: implement getNowPlayingTvShows
    throw UnimplementedError();
  }
}
