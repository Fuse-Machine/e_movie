class MovieTrailer {
  String id;
  String name;
  String key;
  String type;
  String site;

  MovieTrailer(this.id, this.name, this.key, this.type,this.site);

  MovieTrailer.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? "",
        key = json['key'] ?? "",
        type = json['type'] ?? "",
        site = json['site']??"";
}

class MovieTrailerResponse {
  List<MovieTrailer> movieTrailer;
  String error;

  MovieTrailerResponse(this.movieTrailer, this.error);

  MovieTrailerResponse.formJsom(Map<String, dynamic> json)
      : movieTrailer = (json['results'] as List)
            .map((e) => MovieTrailer.fromJson(e))
            .toList(),
        error = "";
  MovieTrailerResponse.withError(errorValue)
      : movieTrailer = [],
        error = errorValue;
}
