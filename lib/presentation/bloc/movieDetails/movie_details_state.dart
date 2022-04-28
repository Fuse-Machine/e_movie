part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class LoadingMovieDetails extends MovieDetailsState {}

// ignore: must_be_immutable
class LoadedMovieDetails extends MovieDetailsState {
  MovieDetails movieDetails;
  LoadedMovieDetails({required this.movieDetails});
}

// ignore: must_be_immutable
class ErroLoadingMovieDetails extends MovieDetailsState {
  String error;
  ErroLoadingMovieDetails({required this.error});
}
