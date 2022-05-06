
import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/movie_trailer.dart';
import 'package:e_movie/data/repositories/movie_trailer_repository.dart';
import 'package:meta/meta.dart';

part 'movie_trailer_event.dart';
part 'movie_trailer_state.dart';

class MovieTrailerBloc extends Bloc<MovieTrailerEvent, MovieTrailerState> {
  MovieTrailerRepository repository;
  MovieTrailerBloc({required this.repository}) : super(MovieTrailerInitial()) {
    on<MovieTrailerEvent>((event, emit) async {
      if (event is FetchMovieTrailer) {
        emit(LoadingMovieTrailer());

        try {
          final MovieTrailerResponse response =
              await repository.getMovieTrailer(event.id);
          
          emit(LoadedMovieTrailer(movieTrailer: response.movieTrailer));
        } catch (error) {
          emit(ErrorLoadingMovieTrailer(error: error.toString()));
        }
      }
    });
  }
}
