import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/movie/presentation/bloc/popular_movie/popular_movie_event.dart';
import 'package:flutter_movie_app/movie/presentation/bloc/popular_movie/popular_movie_state.dart';

import '../../../domain/usecase/get_popular_movies.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMoviesError(failure.toString())),
          (movies) => emit(PopularMoviesLoaded(movies)));
    });
  }
}
