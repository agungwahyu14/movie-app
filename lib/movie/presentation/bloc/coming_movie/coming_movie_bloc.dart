import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/movie/presentation/bloc/Coming_movie/Coming_movie_event.dart';
import 'package:flutter_movie_app/movie/presentation/bloc/Coming_movie/Coming_movie_state.dart';

import '../../../domain/usecase/get_coming_movies.dart';

class ComingMoviesBloc extends Bloc<ComingMoviesEvent, ComingMoviesState> {
  final GetComingMovies getComingMovies;

  ComingMoviesBloc({required this.getComingMovies})
      : super(ComingMoviesInitial()) {
    on<FetchComingMovies>((event, emit) async {
      emit(ComingMoviesLoading());
      final failureOrMovies = await getComingMovies();
      failureOrMovies.fold(
          (failure) => emit(ComingMoviesError(failure.toString())),
          (movies) => emit(ComingMoviesLoaded(movies)));
    });
  }
}
