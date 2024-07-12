import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/movie/domain/usecase/get_trending_movies.dart';

import 'package:flutter_movie_app/movie/presentation/bloc/trending_movie/trending_movie_event.dart';
import 'package:flutter_movie_app/movie/presentation/bloc/trending_movie/trending_movie_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
          (failure) => emit(TrendingMoviesError(failure.toString())),
          (movies) => emit(TrendingMoviesLoaded(movies)));
    });
  }
}
