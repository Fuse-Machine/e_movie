class TvShow {
  int id;
  num popularity;
  String title;
  String poster;
  String backPoster;
  String releaseDate;
  String overview;
  num rating;

  TvShow(this.id, this.popularity, this.title, this.poster, this.backPoster,
      this.releaseDate, this.overview, this.rating);

  TvShow.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'] ?? 0,
        title = json['name'] ?? "",
        poster = json['poster_path'] ?? "",
        backPoster = json['backdrop_path'] ?? "",
        releaseDate = json['first_air_date'] ?? "",
        overview = json['overview'] ?? "",
        rating = json['vote_average'] ?? 0;
}

class TvShowResponse {
  List<TvShow> tvShow;
  int totalPage;
  bool hasError;
  String error;

  TvShowResponse.fromJson(Map<String, dynamic> json)
      : 
      tvShow = (json["results"]as List)
      .map((series) =>TvShow.fromJson(series)).toList(),
        totalPage = json['total_results'],
        hasError = false,
        
        error = "";

  TvShowResponse.withError(errorValue)
      : tvShow = [],
      totalPage=0,
      hasError = true,
        error = errorValue;
}
