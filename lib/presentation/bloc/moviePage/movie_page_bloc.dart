import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/models.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
part 'movie_page_event.dart';
part 'movie_page_state.dart';

class MoviePageBloc extends Bloc<MoviePageEvent, MoviePageState> {
  MovieRepository repository;
  int currentPage = 1;

  ScrollController scrollController = ScrollController();
  MoviePageBloc({required this.repository}) : super(MoviePageInitial()) {
    on<MoviePageEvent>((event, emit) async {
      if (event is FetchMovie) {
        emit(LoadingMovie());
        try {
          MovieResponse response =
              await repository.getNowShowingMovie(currentPage);
          GenreResponse genreResponse = await repository.getGenreList();
          emit(LoadedMovie(
              movie: response.movies,
              totalPage: response.totalPages,
              genre: genreResponse.genre));
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
          emit(LoadedMovie(
              movie: response.movies, totalPage: response.totalPages, genre: genreResponse.genre));
        } catch (error) {
          emit(ErrorLoadingMovie(error: error.toString()));
        }
      }
    });
  }
}
