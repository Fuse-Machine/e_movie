import 'package:e_movie/presentation/bloc/bloc.dart';

import 'package:e_movie/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _upComingMovie(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Now Showing',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          _nowShowingMovie(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Popular',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          _popularMovie(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'All Time Top Rated',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          _allTimeTopRated(),
        ],
      ),
    );
  }

  _upComingMovie() {
    return BlocBuilder<UpcomingBloc, UpcomingState>(
      builder: (context, state) {
        if (state is UpcomingMovieLoading) {
          return const Loading();
        } else if (state is UpcomingMovieFailure) {
          return Text(state.error);
        } else if (state is UpcomingMovieLoaded) {
          return UpcomingMovie(upcoming: state.movie);
        }
        return const SizedBox.shrink();
      },
    );
  }

  _nowShowingMovie() {
    return BlocBuilder<NowshowingBloc, NowshowingState>(
        builder: ((context, state) {
      if (state is NowShowingMovieLoading) {
        return const Loading();
      } else if (state is NowShowingMovieFailure) {
        return Text(state.error);
      } else if (state is NowShowingMovieLoaded) {
        return MovieList(movie: state.movie);
      }
      return const Loading();
    }));
  }

  _popularMovie() {
    return BlocBuilder<PopularBloc, PopularState>(builder: ((context, state) {
      if (state is PopularMovieLoading) {
        return const Loading();
      } else if (state is PopularMovieFailure) {
        return Text(state.error);
      } else if (state is PopularMovieLoaded) {
        return MovieList(movie: state.movie);
      }
      return const Loading();
    }));
  }

  _allTimeTopRated() {
    return BlocBuilder<AlltimeTopratedBloc, AlltimeTopratedState>(
        builder: ((context, state) {
      if (state is AllTimeTopRatedMovieLoading) {
        return const Loading();
      } else if (state is AllTimeTopRatedMovieFailure) {
        return Text(state.error);
      } else if (state is AllTimeTopRatedMovieLoaded) {
        return MovieList(movie: state.movie);
      }
      return const Loading();
    }));
  }
}
