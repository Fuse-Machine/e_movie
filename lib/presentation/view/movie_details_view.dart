import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/genre.dart';
import 'package:e_movie/data/models/movie_details.dart';
import 'package:e_movie/presentation/bloc/SimilarMovie/similar_movie_bloc.dart';
import 'package:e_movie/presentation/bloc/cast/cast_bloc.dart';
import 'package:e_movie/presentation/bloc/movieDetails/movie_details_bloc.dart';
import 'package:e_movie/presentation/widgets/bottom_menu.dart';
import 'package:e_movie/presentation/widgets/cast_list.dart';
import 'package:e_movie/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MovieDetailsView extends StatelessWidget {
  int movieId;
  MovieDetailsView({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        if (state is LoadingMovieDetails) {
          return const Loading();
        } else if (state is LoadedMovieDetails) {
          return _movieDetailsViews(state.movieDetails);
          //return Text(state.movieDetails.genres.length.toString());
        } else if (state is ErroLoadingMovieDetails) {
          return Text(state.error);
        }

        return const Text('Null');
      },
    );
  }

  _movieDetailsViews(MovieDetails movieDetails) {
    return Scaffold(
      bottomNavigationBar: const BottomMenu(),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 285,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 1.8,
                    child:
                        Image.network(Urls.imageUrl + movieDetails.backposter),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 2.0,
                    child: SizedBox(
                      height: 150,
                      child: Image.network(Urls.imageUrl + movieDetails.poster),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieDetails.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          movieDetails.releaseDate,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(Icons.lock_clock),
                const SizedBox(width: 10),
                Text(_changedDuration(movieDetails.runtime)),
                const SizedBox(width: 10),
                _showGenres(movieDetails.genres),
              ],
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movieDetails.overview,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Casts'),
                  _getCast(),
                ],
              ),
            ),
            _movieFinancial(movieDetails),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Similar Movies',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _getSimilarMovie(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _changedDuration(int minutes) {
    int hour = minutes ~/ 60;
    int min = minutes % 60;
    String duration = hour.toString() + 'hrs ' + min.toString() + 'min';
    return duration;
  }

  _showGenres(List<Genre> genres) {
    return Row(
      children: genres
          .map((e) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  e.name,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ))
          .toList(),
    );
  }

  _movieFinancial(MovieDetails movieDetails) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ABOUT MOVIE'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Status:'),
                Text(movieDetails.status),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Budget:'),
                Text(_getInDollar(movieDetails.budget)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Revenue:'),
                Text(_getInDollar(movieDetails.revenue)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String _getInDollar(int budget) {
    return NumberFormat.currency(symbol: "\$").format(budget);
  }

  _getSimilarMovie() {
    return BlocBuilder<SimilarMovieBloc, SimilarMovieState>(
      builder: (context, state) {
        if (state is LoadingSimilarMovie) {
          return const Loading();
        } else if (state is LoadedSimilarMovie) {
          return MovieList(movie: state.movies);
        } else if (state is ErrorLoadingSimilarMovie) {
          return Text(state.error);
        }
        return const SizedBox.shrink();
      },
    );
  }

  _getCast() {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is LoadingCast) {
          return const Loading();
        } else if (state is LoadedCast) {
          return CastList(cast: state.cast);
        } else if (state is ErrorLoadingCast) {
          return Text(state.error);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
