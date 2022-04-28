import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  MovieRepository repository;
  UpcomingBloc({required this.repository}) : super(UpcomingInitial()) {
    on<UpcomingEvent>((event, emit) async {
     if (event is FetchUpcomingMovie) {
        emit(UpcomingMovieLoading());
        try {
          final movieResponse = await repository.getUpcomingMovies();
          emit(UpcomingMovieLoaded(movie: movieResponse.movies));
        } catch (error) {
          emit(UpcomingMovieFailure(error: error.toString()));
        }
      }
    });
  }
}
