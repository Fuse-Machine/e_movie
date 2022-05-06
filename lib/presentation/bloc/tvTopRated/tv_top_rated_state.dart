part of 'tv_top_rated_bloc.dart';

@immutable
abstract class TvTopRatedState {}

class TvTopRatedInitial extends TvTopRatedState {}

class LoadingTvTopRated extends TvTopRatedState {}

// ignore: must_be_immutable
class LoadedTvTopRated extends TvTopRatedState {
  List<TvShow> tvShow;
  LoadedTvTopRated({required this.tvShow});
}

// ignore: must_be_immutable
class ErrorLoadingTvTopRated extends TvTopRatedState {
  String error;
  ErrorLoadingTvTopRated({required this.error});
}
