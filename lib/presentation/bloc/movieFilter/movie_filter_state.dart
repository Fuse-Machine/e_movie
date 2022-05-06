part of 'movie_filter_bloc.dart';

@immutable
abstract class MovieFilterState {}

class MovieFilterInitial extends MovieFilterState {}

class LoadingGenre extends MovieFilterState {}

// ignore: must_be_immutable
class LoadedGenre extends MovieFilterState {
  List<Genre> genre;
  LoadedGenre({required this.genre});
}

// ignore: must_be_immutable
class ErrorLoadingGenre extends MovieFilterState {
  String error;
  ErrorLoadingGenre({required this.error});
}
