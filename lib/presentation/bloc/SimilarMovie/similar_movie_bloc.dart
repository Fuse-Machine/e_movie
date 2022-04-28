import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'similar_movie_event.dart';
part 'similar_movie_state.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  MovieRepository repository;
  SimilarMovieBloc({required this.repository}) : super(SimilarMovieInitial()) {
    on<SimilarMovieEvent>((event, emit) async {
      if (event is FetchSimilarMovie) {
        emit(LoadingSimilarMovie());
        try {
          MovieResponse movieResponse =
              await repository.getSimilarMovie(event.id);
          emit(LoadedSimilarMovie(movies: movieResponse.movies));
        } catch (error) {
          emit(ErrorLoadingSimilarMovie(error: error.toString()));
        }
      }
    });
  }
}
