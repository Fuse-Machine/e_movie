part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class UpcomingMovieLoading extends UpcomingState {}

// ignore: must_be_immutable
class UpcomingMovieLoaded extends UpcomingState {
  List<Movie> movie;
  UpcomingMovieLoaded({required this.movie});
}

// ignore: must_be_immutable
class UpcomingMovieFailure extends UpcomingState {
  String error;
  UpcomingMovieFailure({required this.error});
}
