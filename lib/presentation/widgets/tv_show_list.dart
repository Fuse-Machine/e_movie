
import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/tv_show.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TvShowList extends StatelessWidget {
  List<TvShow> tvShow;
  TvShowList({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: tvShow.length,
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
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => MultiBlocProvider(
                        //         providers: [
                        //           BlocProvider<MovieDetailsBloc>(
                        //             create: (context) => MovieDetailsBloc(
                        //                 repository: MovieRepository())
                        //               ..add(
                        //                 FetchMovieDetails(id: movie[index].id),
                        //               ),
                        //           ),
                        //           BlocProvider<SimilarMovieBloc>(
                        //             create: (context) => SimilarMovieBloc(
                        //                 repository: MovieRepository())
                        //               ..add(
                        //                 FetchSimilarMovie(id: movie[index].id),
                        //               ),
                        //           ),
                        //           BlocProvider<CastBloc>(
                        //             create: (context) =>
                        //                 CastBloc(repository: MovieRepository())
                        //                   ..add(
                        //                     FetchCast(id: movie[index].id),
                        //                   ),
                        //           ),
                        //         ],
                        //         child: const MovieDetailsView(),
                        //       ),

                        //     ),
                        //   );
                        // },

                        child:
                            Image.network(Urls.imageUrl + tvShow[index].poster),
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
