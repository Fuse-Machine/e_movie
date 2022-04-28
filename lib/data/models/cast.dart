class Cast {
  int castId;
  String character;
  String name;
  String profilePath;
  int order;

  Cast(this.castId, this.character, this.name, this.profilePath,this.order);

  Cast.fromJson(Map<String, dynamic> json)
      : castId = json['cast_id'],
        character = json['character']??"",
        name = json['name']??"",
        profilePath = json['profile_path']??"",
        order = json['order']??0;
}

class CastResponse {
  List<Cast> cast;
  String error;

  CastResponse(this.cast, this.error);

  CastResponse.fromJson(Map<String, dynamic> json)
      : cast = (json["cast"] as List)
            .map((castInJson) => Cast.fromJson(castInJson))
            .toList(),
        error = "";

  CastResponse.withError(String errorValue)
      : cast = [],
        error = errorValue;
}
