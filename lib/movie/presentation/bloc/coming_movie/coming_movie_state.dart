import '../../../domain/entities/movie.dart';

abstract class ComingMoviesState {}

class ComingMoviesInitial extends ComingMoviesState {}

class ComingMoviesLoading extends ComingMoviesState {}

class ComingMoviesLoaded extends ComingMoviesState {
  final List<Movie> movies;

  ComingMoviesLoaded(this.movies);
}

class ComingMoviesError extends ComingMoviesState {
  final String message;

  ComingMoviesError(this.message);
}
