import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:e_movie/presentation/bloc/SimilarMovie/similar_movie_bloc.dart';
import 'package:e_movie/presentation/bloc/cast/cast_bloc.dart';
import 'package:e_movie/presentation/view/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/urls.dart';
import '../../data/models/movie.dart';
import '../bloc/movieDetails/movie_details_bloc.dart';

// ignore: must_be_immutable
class MovieList extends StatelessWidget {
  List<Movie> movie;
  MovieList({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: movie.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              left: 8.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 160.0,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiBlocProvider(
                                providers: [
                                  BlocProvider<MovieDetailsBloc>(
                                    create: (context) => MovieDetailsBloc(
                                        repository: MovieRepository())
                                      ..add(
                                        FetchMovieDetails(id: movie[index].id),
                                      ),
                                  ),
                                  BlocProvider<SimilarMovieBloc>(
                                    create: (context) => SimilarMovieBloc(
                                        repository: MovieRepository())
                                      ..add(
                                        FetchSimilarMovie(id: movie[index].id),
                                      ),
                                  ),

                                  BlocProvider<CastBloc>(
                                    create: (context) => CastBloc(
                                        repository: MovieRepository())
                                      ..add(
                                        FetchCast(id: movie[index].id),
                                      ),
                                  ),
                                ],
                                child:
                                    MovieDetailsView(movieId: movie[index].id),
                              ),
                              // builder: (context) => BlocProvider(
                              //   create: (context) => MovieDetailsBloc(
                              //       repository: MovieRepository())
                              //     ..add(FetchMovieDetails(id: movie[index].id)),
                              //   child:
                              //       MovieDetailsView(movieId: movie[index].id),
                              // ),
                            ),
                          );
                        },
                        child:
                            Image.network(Urls.imageUrl + movie[index].poster),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
