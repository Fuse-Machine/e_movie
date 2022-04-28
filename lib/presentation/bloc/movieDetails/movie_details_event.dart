part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

// ignore: must_be_immutable
class FetchMovieDetails extends MovieDetailsEvent {
  int id;
  FetchMovieDetails({required this.id});
}
