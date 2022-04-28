import 'package:bloc/bloc.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/movie.dart';

part 'nowshowing_event.dart';
part 'nowshowing_state.dart';

class NowshowingBloc extends Bloc<NowshowingEvent, NowshowingState> {
  MovieRepository repository;
  NowshowingBloc({required this.repository}) : super(NowshowingInitial()) {
    on<NowshowingEvent>((event, emit) async {
      if (event is FetchNowShowingMovie) {
        emit(NowShowingMovieLoading());
        try {
          final MovieResponse response = await repository.getNowShowingMovie();
          emit(NowShowingMovieLoaded(movie: response.movies));
        } catch (error) {
          emit(NowShowingMovieFailure(error: error.toString()));
        }
      }
    });
  }
}
