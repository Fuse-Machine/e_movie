
import 'package:bloc/bloc.dart';
import 'package:e_movie/data/models/tv_show.dart';
import 'package:e_movie/data/repositories/tv_repository.dart';
import 'package:meta/meta.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  TvRepository repository;
  TvPopularBloc({required this.repository}) : super(TvPopularInitial()) {
    on<TvPopularEvent>((event, emit) async {
      if (event is FetchPopularTV) {
        emit(LoadingPopularTv());
      }
      try {
        // CastResponse castResponse = await repository.getCastDetails(event.id);
        // emit(LoadedCast(cast: castResponse.cast));
        
        TvShowResponse response = await repository.getTvPopular();
       
        emit(LoadedPopularTv(tvShow: response.tvShow));
      } catch (error) {
        emit(ErrorLoadingPopularTv(error: error.toString()));
      }
    });
  }
}
