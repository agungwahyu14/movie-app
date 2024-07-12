import 'package:dartz/dartz.dart';

import '../../../core/errors/server_failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repositories.dart';
import '../datasource/movie_remote_data_source.dart';
import '../model/movie_response_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getPopularMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
         
  @override
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getTrendingMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getComingMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getComingMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
