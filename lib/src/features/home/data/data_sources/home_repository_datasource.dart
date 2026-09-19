import 'package:dio/dio.dart';
import 'package:elemes_flix/config/api_config.dart';
import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/core/network/dio_client.dart';
import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HomeRepositoryDatasource {
  Future<PagedResponse<Movie>> getPopularMovies({int page = 1});
  Future<PagedResponse<Movie>> getNowPlayingMovies({int page = 1});
  Future<PagedResponse<Movie>> searchMovies(String query, {int page = 1});

  //
  Future<PagedResponse<TVShow>> getPopularTvShows({int page = 1});
  Future<PagedResponse<TVShow>> getNowPlayingTvShows({int page = 1});
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
  Future<PagedResponse<Movie>> getPopularMovies({int page = 1}) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<PagedResponse<Movie>> getNowPlayingMovies({int page = 1}) async {
    try {
      final response = await dioClient.get(
        AppApiConfig.nowPlayingMovies,
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return PagedResponse<Movie>(
          page: responseData['page'],
          results: (responseData['results'] as List<dynamic>)
              .map((json) => Movie.fromJson(json))
              .toList(),
          totalPages: responseData['total_pages'],
          totalResults: responseData['total_results'],
        );
      } else {
        throw const ServerFailure('Invalid credentials');
      }
    } on DioException catch (e) {
      throw ServerFailure(e.response?.data['error'] ?? Failure.defaultMessage);
    }
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
