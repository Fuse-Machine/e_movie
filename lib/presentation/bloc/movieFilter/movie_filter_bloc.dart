
import 'package:bloc/bloc.dart';

import 'package:e_movie/data/models/genre.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_filter_event.dart';
part 'movie_filter_state.dart';

class MovieFilterBloc extends Bloc<MovieFilterEvent, MovieFilterState> {
  MovieRepository repository;
  MovieFilterBloc({required this.repository}) : super(MovieFilterInitial()) {
    on<MovieFilterEvent>((event, emit) async {
      if (event is FetchGenre) {
        emit(LoadingGenre());

        try {
          GenreResponse response = await repository.getGenreList();
          
          emit(LoadedGenre(genre: response.genre));
        } catch (error) {
          emit(ErrorLoadingGenre(error: error.toString()));
        }
      }
    });
  }
}
