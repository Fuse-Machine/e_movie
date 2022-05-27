import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/models.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_page_event.dart';
part 'movie_page_state.dart';

class MoviePageBloc extends Bloc<MoviePageEvent, MoviePageState> {
  MovieRepository repository;

  int totalPage = 0;
  List<Movie> movies = [];
  ScrollController scrollController = ScrollController();
  MoviePageBloc({required this.repository}) : super(MoviePageInitial()) {
    on<MoviePageEvent>((event, emit) async {
      if (event is FetchMovie) {
        emit(LoadingMovie());
        try {
          MovieResponse response =
              await repository.getNowShowingMovie(event.pageNumber);
          GenreResponse genreResponse = await repository.getGenreList();
          movies = movies + response.movies;
          totalPage = response.totalPages;
          emit(LoadedMovie(movies: movies, genre: genreResponse.genre));
        } catch (error) {
          emit(ErrorLoadingMovie(error: error.toString()));
        }
      }
      if (event is FetchNextPageMovie) {
        emit(LoadingMovie());
        try {
          MovieResponse response =
              await repository.getNowShowingMovie(event.page);
          GenreResponse genreResponse = await repository.getGenreList();
          emit(
              LoadedMovie(movies: response.movies, genre: genreResponse.genre));
        } catch (error) {
          emit(ErrorLoadingMovie(error: error.toString()));
        }
      }
    });
  }
}
