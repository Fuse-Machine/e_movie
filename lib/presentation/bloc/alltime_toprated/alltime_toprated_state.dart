part of 'alltime_toprated_bloc.dart';

@immutable
abstract class AlltimeTopratedState {}

class AlltimeTopratedInitial extends AlltimeTopratedState {}

class AllTimeTopRatedMovieLoading extends AlltimeTopratedState {}

// ignore: must_be_immutable
class AllTimeTopRatedMovieLoaded extends AlltimeTopratedState {
  List<Movie> movie;
  AllTimeTopRatedMovieLoaded({required this.movie});
}

// ignore: must_be_immutable
class AllTimeTopRatedMovieFailure extends AlltimeTopratedState {
  String error;
  AllTimeTopRatedMovieFailure({required this.error});
}
