
import '../../domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final double popularity;
  final int voteCount;
  final double voteAverage;
  final String overview;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.popularity,
    required this.voteCount,
    required this.voteAverage,
    required this.overview,
  });

  // Convert JSON into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      popularity: json['popularity'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'],
      overview: json['overview'],
    );
  }

  // Convert MovieModel into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'popularity': popularity,
      'vote_count': voteCount,
      'vote_average': voteAverage,
      'overview': overview,
    };
  }

  // Convert MovieModel to Movie entity
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      popularity: popularity,
      voteCount: voteCount,
      voteAverage: voteAverage,
      overview: overview,
    );
  }
}
