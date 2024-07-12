import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 200,
          width: 400,
          child: Ink.image(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
