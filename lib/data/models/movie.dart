class Movie {
  final int id;
  final num popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final num rating;
  final String releaseDate;

  const Movie(this.id, this.popularity, this.title, this.backPoster,
      this.poster, this.overview, this.rating, this.releaseDate);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"] ?? 0,
        title = json["title"] ?? "",
        backPoster = json["backdrop_path"] ?? "",
        poster = json["poster_path"] ?? "",
        overview = json["overview"] ?? "",
        rating = json["vote_average"] ?? 0.0,
        releaseDate = json["release_date"] ?? "";
}
/*
Response
  data
    - movies [{},{},{}...]

*/

class MovieResponse {
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;
  final bool hasError;
  final String error;

  MovieResponse(this.movies, this.totalPages, this.totalResults, this.hasError,
      this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies =
            (json["results"] as List).map((i) => Movie.fromJson(i)).toList(),
        totalPages = json['total_pages'],
        totalResults = json["total_results"],
        hasError = false,
        error = "";

  MovieResponse.withError(String errorValue)
      : movies = [],
        totalPages = 0,
        totalResults = 0,
        hasError = true,
        error = errorValue;
}
