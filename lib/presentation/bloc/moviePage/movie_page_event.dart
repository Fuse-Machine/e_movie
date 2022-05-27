// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable

part of 'movie_page_bloc.dart';

@immutable
abstract class MoviePageEvent {}

class FetchMovie extends MoviePageEvent {
  int pageNumber;
  FetchMovie({required this.pageNumber});
}

class FetchNextPageMovie extends MoviePageEvent {
  int page;
  FetchNextPageMovie({required this.page});
}

class ScrollUpDown extends MoviePageEvent {
  int pageNumber;
  ScrollUpDown({required this.pageNumber});
}
