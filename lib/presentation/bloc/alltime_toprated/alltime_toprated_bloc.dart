import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'alltime_toprated_event.dart';
part 'alltime_toprated_state.dart';

class AlltimeTopratedBloc
    extends Bloc<AlltimeTopratedEvent, AlltimeTopratedState> {
  MovieRepository repository;
  AlltimeTopratedBloc({required this.repository})
      : super(AlltimeTopratedInitial()) {
    on<AlltimeTopratedEvent>((event, emit) async {
      if (event is FetchAllTimeTopRatedMovie) {
        emit(AllTimeTopRatedMovieLoading());
        try{
          final MovieResponse response = await repository.getAllTimeTopRatedMovie();
          emit(AllTimeTopRatedMovieLoaded(movie: response.movies));
        }catch(error){
          emit(AllTimeTopRatedMovieFailure(error:error.toString()));
        }
      }
    });
  }
}
