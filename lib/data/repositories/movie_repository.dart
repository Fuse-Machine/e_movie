import 'package:dio/dio.dart';
import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/cast.dart';
import 'package:e_movie/data/models/genre.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/data/models/movie_details.dart';

class MovieRepository {
  final Dio _dio = Dio();

  Future<MovieResponse> getUpcomingMovies() async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(Urls.getUpComingApi, queryParameters: params);

      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieResponse> getNowShowingMovie(int page) async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": page};
    try {
      
      Response response =
          await _dio.get(Urls.getNowPlayingMoviesApi, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieResponse> getPopularMovie() async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(Urls.getPopularMoviesApi, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieResponse> getAllTimeTopRatedMovie() async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(Urls.getTopRatedMoviesApi, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieResponse.withError("Error:$error, StackTrace:$stacktrace");
    }
  }

  Future<MovieResponse> getSimilarMovie(int movieId) async {
    var params = {"api_key": Urls.apiKey, "language": "en-US", "page": 1};
    try {
      Response response = await _dio.get(
          Urls.movieUrl + '/$movieId' + '/similar',
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieResponse.withError("Error:$error, StackTrace:$stacktrace");
    }
  }

  Future<MovieDetailsReponse> getMovieDetails(int id) async {
    var params = {'api_key': Urls.apiKey, 'language': 'en-US'};
    try {
      Response response =
          await _dio.get(Urls.movieUrl + '/$id', queryParameters: params);
      return MovieDetailsReponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieDetailsReponse.withError(
          "Error:$error,StackTrace:$stacktrace");
    }
  }

  Future<CastResponse> getCastDetails(int id) async {
    var params = {'api_key': Urls.apiKey, 'language': 'en-US'};
    try {
      Response response = await _dio.get(Urls.movieUrl + '/$id' + '/credits',
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return CastResponse.withError("Error:$error,StackTrace:$stacktrace");
    }
  }

  Future<GenreResponse> getGenreList() async {
    var params = {'api_key': Urls.apiKey, 'language': 'en-US'};
    try {
      Response response =
          await _dio.get(Urls.getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return GenreResponse.withError("Error:$error,StackTrace:$stacktrace");
    }
  }
}
