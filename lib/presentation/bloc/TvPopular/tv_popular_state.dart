part of 'tv_popular_bloc.dart';

@immutable
abstract class TvPopularState {}

class TvPopularInitial extends TvPopularState {}

class LoadingPopularTv extends TvPopularState {}

// ignore: must_be_immutable
class LoadedPopularTv extends TvPopularState {
  List<TvShow> tvShow;
  LoadedPopularTv({required this.tvShow});
}

// ignore: must_be_immutable
class ErrorLoadingPopularTv extends TvPopularState {
  String error;
  ErrorLoadingPopularTv({required this.error});
}
