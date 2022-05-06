part of 'movie_page_bloc.dart';

@immutable
abstract class MoviePageEvent {}

class FetchMovie extends MoviePageEvent {}

// ignore: must_be_immutable
class FetchNextPageMovie extends MoviePageEvent {
  int page;
  FetchNextPageMovie({required this.page});
}
