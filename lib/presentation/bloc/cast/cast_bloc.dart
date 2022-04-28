import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/cast.dart';
import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  MovieRepository repository;
  CastBloc({required this.repository}) : super(CastInitial()) {
    on<CastEvent>((event, emit) async {
      if (event is FetchCast) {
        emit(LoadingCast());
        try {
          CastResponse castResponse = await repository.getCastDetails(event.id);
          emit(LoadedCast(cast: castResponse.cast));
        } catch (error) {
          emit(ErrorLoadingCast(error: error.toString()));
        }
      }
    });
  }
}
