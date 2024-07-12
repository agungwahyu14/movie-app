import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_list.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return MovieCard(movie);
        }),
      ),
    );
  }
}

class MovieListVertical extends StatelessWidget {
  final List<Movie> movies;

  const MovieListVertical({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return MovieCardList(movie);
        }),
      ),
    );
  }
}
