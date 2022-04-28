part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularMovieLoading extends PopularState {}

// ignore: must_be_immutable
class PopularMovieLoaded extends PopularState {
  List<Movie> movie;
  PopularMovieLoaded({required this.movie});
}

// ignore: must_be_immutable
class PopularMovieFailure extends PopularState {
  String error;
  PopularMovieFailure({required this.error});
}
