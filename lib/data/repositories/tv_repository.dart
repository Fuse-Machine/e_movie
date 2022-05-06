import 'package:dio/dio.dart';
import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/tv_show.dart';

class TvRepository {
  final Dio _dio = Dio();

  Future<TvShowResponse> getTvPopular() async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(Urls.getPopularTvUrl, queryParameters: params);

      return TvShowResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      return TvShowResponse.withError("Error:$error,StackTrace:$stackTrace");
    }
  }

  Future<TvShowResponse> getTvTopRated() async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(Urls.getTopRatedTvUrl, queryParameters: params);
      return TvShowResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return TvShowResponse.withError("Error:$error,StackTrace:$stacktrace");
    }
  }
}
