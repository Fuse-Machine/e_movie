import 'package:e_movie/presentation/bloc/bloc.dart';
import 'package:e_movie/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviePageBloc, MoviePageState>(
      builder: (context, state) {
        if (state is LoadingMovie) {
          return const Loading();
        } else if (state is LoadedMovie) {
          return MovieListGridview(movie: state.movies, genre: state.genre,);
        } else if (state is ErrorLoadingMovie) {
          return Text(state.error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
