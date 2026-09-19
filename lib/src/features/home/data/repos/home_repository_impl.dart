import 'package:elemes_flix/shared/models/paged_response_model.dart';
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
  Future<PagedResponse<Movie>> getPopularMovies({int page = 1}) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<PagedResponse<Movie>> getNowPlayingMovies({int page = 1}) {
    return homeRepositoryDatasource.getNowPlayingMovies(page: page);
  }

  @override
  Future<PagedResponse<Movie>> searchMovies(String query, {int page = 1}) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

  @override
  Future<PagedResponse<TVShow>> getPopularTvShows({int page = 1}) {
    // TODO: implement getPopularTvShows
    throw UnimplementedError();
  }

  @override
  Future<PagedResponse<TVShow>> getNowPlayingTvShows({int page = 1}) {
    // TODO: implement getNowPlayingTvShows
    throw UnimplementedError();
  }
}
