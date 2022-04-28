part of 'nowshowing_bloc.dart';

@immutable
abstract class NowshowingState {}

class NowshowingInitial extends NowshowingState {}

class NowShowingMovieLoading extends NowshowingState {}

// ignore: must_be_immutable
class NowShowingMovieLoaded extends NowshowingState {
  List<Movie> movie;
  NowShowingMovieLoaded({required this.movie});
}

// ignore: must_be_immutable
class NowShowingMovieFailure extends NowshowingState {
  String error;
  NowShowingMovieFailure({required this.error});
}
