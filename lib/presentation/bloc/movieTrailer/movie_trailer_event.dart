part of 'movie_trailer_bloc.dart';

@immutable
abstract class MovieTrailerEvent {}

// ignore: must_be_immutable
class FetchMovieTrailer extends MovieTrailerEvent {
  int id;
  FetchMovieTrailer({required this.id});
}
