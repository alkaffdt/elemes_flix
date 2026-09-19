import 'package:dio/dio.dart';
import 'package:elemes_flix/config/api_config.dart';
import 'package:elemes_flix/core/error/failures.dart';
import 'package:elemes_flix/core/network/dio_client.dart';
import 'package:elemes_flix/shared/models/paged_response_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:elemes_flix/src/features/home/domain/models/tv_show_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HomeRepositoryDatasource {
  Future<PagedResponse<MediaItem>> getPopularMovies({int page = 1});
  Future<PagedResponse<MediaItem>> getNowPlayingMovies({int page = 1});
  Future<PagedResponse<MediaItem>> searchContents(String query, {int page = 1});

  //
  Future<PagedResponse<MediaItem>> getPopularTvShows({int page = 1});
  Future<PagedResponse<MediaItem>> getNowPlayingTvShows({int page = 1});
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
  Future<PagedResponse<MediaItem>> getPopularMovies({int page = 1}) async {
    try {
      final response = await dioClient.get(
        AppApiConfig.popularMovies,
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return PagedResponse<MediaItem>(
          page: responseData['page'],
          results: (responseData['results'] as List<dynamic>)
              .map((json) => MediaItem.fromJson(json))
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
  Future<PagedResponse<MediaItem>> getNowPlayingMovies({int page = 1}) async {
    try {
      final response = await dioClient.get(
        AppApiConfig.nowPlayingMovies,
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return PagedResponse<MediaItem>(
          page: responseData['page'],
          results: (responseData['results'] as List<dynamic>)
              .map((json) => MediaItem.fromJson(json))
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
  Future<PagedResponse<MediaItem>> searchContents(
    String keyword, {
    int page = 1,
  }) async {
    try {
      final response = await dioClient.get(
        AppApiConfig.search,
        queryParameters: {'query': keyword, 'page': page},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return PagedResponse<MediaItem>(
          page: responseData['page'],
          results: (responseData['results'] as List<dynamic>)
              .map((json) => MediaItem.fromJson(json))
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
  Future<PagedResponse<MediaItem>> getPopularTvShows({int page = 1}) async {
    try {
      final response = await dioClient.get(
        AppApiConfig.popularTvShows,
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return PagedResponse<MediaItem>(
          page: responseData['page'],
          results: (responseData['results'] as List<dynamic>)
              .map((json) => MediaItem.fromJson(json))
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
  Future<PagedResponse<MediaItem>> getNowPlayingTvShows({int page = 1}) async {
    try {
      final response = await dioClient.get(
        AppApiConfig.nowPlayingTvShows,
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return PagedResponse<MediaItem>(
          page: responseData['page'],
          results: (responseData['results'] as List<dynamic>)
              .map((json) => MediaItem.fromJson(json))
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
}
