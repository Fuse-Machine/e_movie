import 'package:dio/dio.dart';
import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/movie_trailer.dart';

class MovieTrailerRepository {
  final Dio _dio = Dio();

  Future<MovieTrailerResponse> getMovieTrailer(int movieId) async {
    var params = {"api_key": Urls.apiKey, "language": "en-US"};
    try {
      // Response response =
      //   await _dio.get(Urls.getPopularTvUrl, queryParameters: params);

      Response response = await _dio.get(
          Urls.movieUrl + '/$movieId' + '/videos',
          queryParameters: params);
      return MovieTrailerResponse.formJsom(response.data);
    } catch (error, stackTrace) {
      return MovieTrailerResponse.withError(
          "Error:$error,StackTrace:$stackTrace");
    }
  }
}
