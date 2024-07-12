import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/domain/entities/movie.dart';


class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(
        child: Text('Detail for ${movie.title}'),
      ),
    );
  }
}
