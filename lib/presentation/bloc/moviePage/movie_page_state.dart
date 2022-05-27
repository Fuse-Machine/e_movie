part of 'movie_page_bloc.dart';

@immutable
abstract class MoviePageState {}

class MoviePageInitial extends MoviePageState {}

class LoadingMovie extends MoviePageState {}

// ignore: must_be_immutable
class LoadedMovie extends MoviePageState {
  List<Genre> genre;
  List<Movie> movies;
  LoadedMovie({required this.movies, required this.genre});
}

// ignore: must_be_immutable
class ErrorLoadingMovie extends MoviePageState {
  String error;
  ErrorLoadingMovie({required this.error});
}
