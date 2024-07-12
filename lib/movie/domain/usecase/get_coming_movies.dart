import 'package:dartz/dartz.dart';

import '../../../core/errors/server_failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repositories.dart';

class GetComingMovies {
  final MovieRepository repository;

  GetComingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getComingMovies();
  }
}
