import 'package:dio/dio.dart';
import 'package:flutter_movie_app/static/app_setting.dart';

import '../../../core/errors/server_exception.dart';
import '../model/movie_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getComingMovies();
  // Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    String baseUrl = AppSetting().baseUrlPopular;

    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {'api_key': AppSetting().key},
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;
        final List<MovieModel> movies = (responseBody['results'] as List)
            .map((movie) => MovieModel.fromJson(movie))
            .toList();
        return movies;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    String baseUrl = AppSetting().baseUrlTopRated;

    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {'api_key': AppSetting().key},
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;
        final List<MovieModel> movies = (responseBody['results'] as List)
            .map((movie) => MovieModel.fromJson(movie))
            .toList();
        return movies;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getComingMovies() async {
    String baseUrl = AppSetting().baseUpcoming;

    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {'api_key': AppSetting().key},
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;
        final List<MovieModel> movies = (responseBody['results'] as List)
            .map((movie) => MovieModel.fromJson(movie))
            .toList();
        return movies;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
