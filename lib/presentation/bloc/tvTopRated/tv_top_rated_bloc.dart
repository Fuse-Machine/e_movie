import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/tv_show.dart';
import 'package:e_movie/data/repositories/tv_repository.dart';
import 'package:meta/meta.dart';

part 'tv_top_rated_event.dart';
part 'tv_top_rated_state.dart';

class TvTopRatedBloc extends Bloc<TvTopRatedEvent, TvTopRatedState> {
  TvRepository repository;
  TvTopRatedBloc({required this.repository}) : super(TvTopRatedInitial()) {
    on<TvTopRatedEvent>((event, emit) async {
      if (event is FetchTvTopRated) {
        emit(LoadingTvTopRated());
      }
      try {
        TvShowResponse response = await repository.getTvTopRated();
        emit(LoadedTvTopRated(tvShow: response.tvShow));
      } catch (error) {
        emit(ErrorLoadingTvTopRated(error: error.toString()));
      }
    });
  }
}
