import 'package:dio/dio.dart';
import 'package:flutter_movie_app/static/app_setting.dart';
import 'package:get_it/get_it.dart';

import '../../movie/data/datasource/movie_remote_data_source.dart';
import '../../movie/data/repository/movie_repository_impl.dart';
import '../../movie/domain/repositories/movie_repositories.dart';
import '../../movie/domain/usecase/get_coming_movies.dart';
import '../../movie/domain/usecase/get_popular_movies.dart';
import '../../movie/domain/usecase/get_trending_movies.dart';
import '../../movie/presentation/bloc/coming_movie/coming_movie_bloc.dart';
import '../../movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import '../../movie/presentation/bloc/trending_movie/trending_movie_bloc.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> locatorInit() async {
  final appSetting = AppSetting();

  // Register Blocs
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => ComingMoviesBloc(getComingMovies: getIt()));

  // Register Use Cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => GetComingMovies(getIt()));

  // Register Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Register Data Sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dio: getIt()));

  // Register Dio Client
  getIt.registerLazySingleton<Dio>(() => DioClient(appSetting).dio);
}
