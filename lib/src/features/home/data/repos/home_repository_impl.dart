import 'package:elemes_flix/src/features/home/data/data_sources/home_repository_datasource.dart';
import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';
import 'package:elemes_flix/src/features/home/domain/repos/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepositoryImpl>((ref) {
  return HomeRepositoryImpl(ref.watch(homeRepositoryDatasourceProvider));
});

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.homeRepositoryDatasource);

  final HomeRepositoryDatasource homeRepositoryDatasource;

  @override
  Future<List<Movie>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    return homeRepositoryDatasource.getNowPlayingMovies();
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
