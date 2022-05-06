import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/genre.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MovieListGridview extends StatelessWidget {
  List<Movie> movie;
  List<Genre> genre;
  int totalPages;
  MovieListGridview({
    Key? key,
    required this.movie,
    required this.genre,
    required this.totalPages,
  }) : super(key: key);
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    MoviePageBloc bloc = BlocProvider.of<MoviePageBloc>(context, listen: true);
    _initializer(bloc);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      
      ),
      
      body: Column(
        children: [
          
          Expanded(
            child: _getMovies(context, bloc),
          ),
        ],
      ),
    );
  }

  _getMovies(BuildContext context, MoviePageBloc bloc) {
    return BlocBuilder<MoviePageBloc, MoviePageState>(
      builder: (context, state) {
        if (state is LoadedMovie) {
          return GridView.builder(
              controller: bloc.scrollController,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 40,
                crossAxisSpacing: 25,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: movie.length,
              itemBuilder: (context, index) {
                return FittedBox(
                    fit: BoxFit.fill,
                    child: (movie[index].poster != "" ||
                            movie[index].poster.isNotEmpty)
                        ? Image.network(Urls.imageUrl + movie[index].poster)
                        : const Text('No Poster'));
              });
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _initializer(MoviePageBloc bloc) {
    bloc.scrollController.addListener(() {
      if (bloc.scrollController.position.atEdge) {
        if (bloc.scrollController.position.pixels ==
            bloc.scrollController.position.maxScrollExtent) {
          if (currentPage <= totalPages) {
            bloc.add(FetchNextPageMovie(page: ++currentPage));
          }
        } else {
          if (currentPage >= 1) {
            bloc.add(FetchNextPageMovie(page: --currentPage));
          }
        }
      }
    });
  }

}
