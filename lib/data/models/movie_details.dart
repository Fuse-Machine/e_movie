import 'genre.dart';

class MovieDetails {
 
  int id;
  num popularity;
  String title;
  String backposter;
  String poster;
  String overview;
  num rating;
  String releaseDate;
  List<Genre> genres;
  int budget;
  int revenue;
  String status;
  int runtime;

  MovieDetails(
      this.id,
      this.popularity,
      this.title,
      this.backposter,
      this.poster,
      this.overview,
      this.rating,
      this.releaseDate,
      this.genres,
      this.budget,
      this.revenue,
      this.status,
      this.runtime);

  MovieDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'] ?? 0,
        title = json['title'] ?? "",
        backposter = json['backdrop_path'] ?? "",
        poster = json['poster_path'] ?? "",
        overview = json['overview'] ?? "",
        rating = json['vote_average'] ?? 0.0,
        releaseDate = json['release_date'] ?? "",
        genres =
            (json['genres'] as List).map((e) => Genre.formJson(e)).toList(),
        budget = json['budget'] ?? 0,
        revenue = json['revenue'] ?? 0,
        status = json['status'] ?? "",
        runtime = json['runtime'] ?? 0;

  static var empty =
      MovieDetails(0, 0, "", "", "", "", 0.0, "", [], 0, 0, "", 0);
}

class MovieDetailsReponse {
  MovieDetails movieDetails;
  String error;

  MovieDetailsReponse.fromJson(Map<String, dynamic> json)
      : movieDetails = MovieDetails.fromJson(json),
        error = "";

  MovieDetailsReponse.withError(String errorValue)
      : movieDetails = MovieDetails.empty,
        error = errorValue;
}
