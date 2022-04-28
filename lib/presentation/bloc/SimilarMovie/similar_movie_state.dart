part of 'similar_movie_bloc.dart';

@immutable
abstract class SimilarMovieState {}

class SimilarMovieInitial extends SimilarMovieState {}

class LoadingSimilarMovie extends SimilarMovieState {}

// ignore: must_be_immutable
class LoadedSimilarMovie extends SimilarMovieState {
  List<Movie> movies;
  LoadedSimilarMovie({required this.movies});
}

// ignore: must_be_immutable
class ErrorLoadingSimilarMovie extends SimilarMovieState {
  String error;
  ErrorLoadingSimilarMovie({required this.error});
}
