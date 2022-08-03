class Movie {
  int id;
  String title;
  String overview;
  String poster_path;
  double vote_average;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
    required this.vote_average,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map["id"],
      title: map["title"],
      overview: map["overview"],
      poster_path: map["poster_path"],
      vote_average: map["vote_average"],
    );
  }
//

}
