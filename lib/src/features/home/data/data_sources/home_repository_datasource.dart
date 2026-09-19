import 'package:dio/dio.dart';
import 'package:elemes_flix/config/api_config.dart';
import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/core/network/dio_client.dart';
import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HomeRepositoryDatasource {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> searchMovies(String query);

  //
  Future<List<TVShow>> getPopularTvShows();
  Future<List<TVShow>> getNowPlayingTvShows();
}

final homeRepositoryDatasourceProvider = Provider<HomeRepositoryDatasource>((
  ref,
) {
  return HomeRepositoryDatasourceImpl(ref.watch(dioClientProvider));
});

class HomeRepositoryDatasourceImpl implements HomeRepositoryDatasource {
  final DioClient dioClient;

  HomeRepositoryDatasourceImpl(this.dioClient);

  @override
  Future<List<Movie>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final response = await dioClient.get(AppApiConfig.nowPlayingMovies);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw const ServerFailure('Invalid credentials');
      }
    } on DioException catch (e) {
      throw ServerFailure(e.response?.data['error'] ?? Failure.defaultMessage);
    }
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
