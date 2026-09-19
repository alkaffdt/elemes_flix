import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/data/data_sources/home_repository_datasource.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
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
  Future<PagedResponse<MediaItem>> getPopularMovies({int page = 1}) {
    return homeRepositoryDatasource.getPopularMovies(page: page);
  }

  @override
  Future<PagedResponse<MediaItem>> getNowPlayingMovies({int page = 1}) {
    return homeRepositoryDatasource.getNowPlayingMovies(page: page);
  }

  @override
  Future<PagedResponse<MediaItem>> searchMovies(String query, {int page = 1}) {
    return homeRepositoryDatasource.searchMovies(query, page: page);
  }

  @override
  Future<PagedResponse<MediaItem>> getPopularTvShows({int page = 1}) {
    return homeRepositoryDatasource.getPopularTvShows(page: page);
  }

  @override
  Future<PagedResponse<MediaItem>> getNowPlayingTvShows({int page = 1}) {
    return homeRepositoryDatasource.getNowPlayingTvShows(page: page);
  }
}
