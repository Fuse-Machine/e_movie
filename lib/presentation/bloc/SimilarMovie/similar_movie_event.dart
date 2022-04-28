part of 'similar_movie_bloc.dart';

@immutable
abstract class SimilarMovieEvent {}

// ignore: must_be_immutable
class FetchSimilarMovie extends SimilarMovieEvent {
  int id;
  FetchSimilarMovie({required this.id});
}
