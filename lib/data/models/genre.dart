class Genre {
  int id;
  String name;

  Genre(this.id, this.name);

  Genre.formJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class GenreResponse {
  List<Genre> genre;
  String error;

  GenreResponse(this.genre, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genre = (json['genre'] as List).map((e) => Genre.formJson(e)).toList(),
        error = "";
  GenreResponse.withError(String errorValue)
      : genre = [],
        error = errorValue;
}
