class Movie {
  final int id;
  final String title;
  final String posterPath;
  final double popularity;
  final int voteCount;
  final double voteAverage;
  final String overview;

  Movie(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.popularity,
      required this.voteCount,
      required this.voteAverage,
      required this.overview});

  @override
  List<Object?> get props =>
      [id, title, posterPath, popularity, voteCount, voteAverage, overview];
}
