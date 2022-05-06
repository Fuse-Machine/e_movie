part of 'movie_trailer_bloc.dart';

@immutable
abstract class MovieTrailerState {}

class MovieTrailerInitial extends MovieTrailerState {}

class LoadingMovieTrailer extends MovieTrailerState {}

// ignore: must_be_immutable
class LoadedMovieTrailer extends MovieTrailerState {
  List<MovieTrailer> movieTrailer;
  LoadedMovieTrailer({required this.movieTrailer});
}

// ignore: must_be_immutable
class ErrorLoadingMovieTrailer extends MovieTrailerState {
  String error;
  ErrorLoadingMovieTrailer({required this.error});
}
