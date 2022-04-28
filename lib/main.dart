import 'package:e_movie/data/repositories/movie_repository.dart';
import 'package:e_movie/presentation/bloc/SimilarMovie/similar_movie_bloc.dart';

import 'package:e_movie/presentation/bloc/bloc.dart';
import 'package:e_movie/presentation/bloc/cast/cast_bloc.dart';
import 'package:e_movie/presentation/bloc/movieDetails/movie_details_bloc.dart';

import 'package:e_movie/presentation/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w200,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<UpcomingBloc>(
          create: (context) => UpcomingBloc(repository: MovieRepository())
            ..add(FetchUpcomingMovie()),
        ),
        BlocProvider<NowshowingBloc>(
          create: (context) => NowshowingBloc(repository: MovieRepository())
            ..add(FetchNowShowingMovie()),
        ),
        BlocProvider<PopularBloc>(
          create: (context) => PopularBloc(repository: MovieRepository())
            ..add(FetchPopularMovie()),
        ),
        BlocProvider<AlltimeTopratedBloc>(
          create: (context) =>
              AlltimeTopratedBloc(repository: MovieRepository())
                ..add(FetchAllTimeTopRatedMovie()),
        ),
        BlocProvider<MovieDetailsBloc>(
            create: ((context) =>
                MovieDetailsBloc(repository: MovieRepository()))),
        BlocProvider<SimilarMovieBloc>(
            create: ((context) =>
                SimilarMovieBloc(repository: MovieRepository()))),
        BlocProvider<CastBloc>(
            create: ((context) => CastBloc(repository: MovieRepository()))),
      ], child: const LandingPage()),
    );
  }
}
