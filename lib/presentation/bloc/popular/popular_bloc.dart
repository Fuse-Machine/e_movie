import 'package:bloc/bloc.dart';

import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  MovieRepository repository;
  PopularBloc({required this.repository}) : super(PopularInitial()) {
    on<PopularEvent>((event, emit) async {
      if (event is FetchPopularMovie) {
        emit(PopularMovieLoading());
        try {
          final MovieResponse response = await repository.getPopularMovie();
          emit(PopularMovieLoaded(movie: response.movies));
        } catch (error) {
          emit(PopularMovieFailure(error: error.toString()));
        }
      }
    });
  }
}
