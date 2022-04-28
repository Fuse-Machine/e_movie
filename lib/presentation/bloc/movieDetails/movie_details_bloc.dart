import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/movie_details.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieRepository repository;
  MovieDetailsBloc({required this.repository}) : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is FetchMovieDetails) {
        emit(LoadingMovieDetails());
        try {
          MovieDetailsReponse response =
              await repository.getMovieDetails(event.id);
          emit(LoadedMovieDetails(movieDetails: response.movieDetails));
        } catch (error) {
          emit(ErroLoadingMovieDetails(error: error.toString()));
        }
      }
    });
  }
}
