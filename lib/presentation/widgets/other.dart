


import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/genre.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:e_movie/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MovieListGridview extends StatefulWidget {
  List<Movie> movie;
  List<Genre> genre;

  MovieListGridview({
    Key? key,
    required this.movie,
    required this.genre,
  }) : super(key: key);

  @override
  State<MovieListGridview> createState() => _MovieListGridviewState();
}

class _MovieListGridviewState extends State<MovieListGridview> {
  int currentPage = 1;
  List<String> options = ['Two', 'Three', 'Four'];
  String dropDownValue = "Three";
  String val = 'Four';
  int _col = 2;

  List<Map> filterGenre = [];

  @override
  Widget build(BuildContext context) {
    for (var element in widget.genre) {
      filterGenre = filterGenre +
          [
            {'name': element.name, 'id': element.id, 'isChecked': true}
          ];
      // filterGenre = filterGenre +

      //       {'name': ele.name, 'id': ele.id, 'isChecked': true}
      //     ;
    }

    MoviePageBloc bloc = BlocProvider.of<MoviePageBloc>(context, listen: true);
    int totalPage = bloc.totalPage;
    
    _initializer(bloc, totalPage);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context, builder: (ctx) => _buildFilterSheet(ctx)),
        child: const Icon(Icons.menu),
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

  // _drawer() {
  //   log(filterGenre.toString());
  //   return Drawer(
  //     backgroundColor: const Color.fromARGB(255, 143, 164, 182),
  //     child: ListView(
  //       padding: const EdgeInsets.only(top: 50.0, left: 20),
  //       children: [
  //         const Text('Filters'),
  //         const SizedBox(height: 15),
  //         ExpansionTile(
  //           title: const Text('Number of Movies per Row'),
  //           children: options
  //               .map((option) => ListTile(
  //                     title: Text(option),
  //                     leading: Radio<String>(
  //                       groupValue: val,
  //                       value: option,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           val = value!;
  //                         });
  //                         if (val == 'Two') _col = 2;
  //                         if (val == 'Three') _col = 3;
  //                         if (val == 'Four') _col = 4;
  //                       },
  //                     ),
  //                   ))
  //               .toList(),
  //         ),
  //         Column(
  //           children: [
  //             Expanded(
  //               child: ExpansionTile(
  //                 title: const Text('Genre'),
  //                 children: filterGenre
  //                         .map((option) => ListTile(
  //                               leading: CheckboxListTile(
  //                                 title: const Text('Title'),
  //                                 value: option['isChecked'],
  //                                 onChanged: (value) {
  //                                   option['isChecked'] = value;
  //                                 },
  //                               ),
  //                             ))
  //                         .toList()
  //                     ,
  //               ),
  //             ),
  //           ],
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }

  _getMovies(BuildContext context, MoviePageBloc bloc) {
    return BlocBuilder<MoviePageBloc, MoviePageState>(
      builder: (context, state) {
        if (state is LoadedMovie) {
          return GridView.builder(
              controller: bloc.scrollController,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _col,
                mainAxisSpacing: 40,
                crossAxisSpacing: 25,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: widget.movie.length,
              itemBuilder: (context, index) {
                return FittedBox(
                    fit: BoxFit.fill,
                    child: (widget.movie[index].poster != "" ||
                            widget.movie[index].poster.isNotEmpty)
                        ? Image.network(
                            Urls.imageUrl + widget.movie[index].poster)
                        : const Text('No Poster'));
              });
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _initializer(MoviePageBloc bloc, int totalPages) {
    bloc.scrollController.addListener(() {
      if (bloc.scrollController.position.atEdge) {
        if (bloc.scrollController.position.pixels ==
            bloc.scrollController.position.maxScrollExtent) {
          if (currentPage <= totalPages) {
            currentPage++;
          }
        } else {}
        bloc.add(FetchMovie(pageNumber: currentPage));
      }
    });
  }

  Container _buildFilterSheet(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 106, 97, 97),
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const ListTile(
            title: Center(
              child: Text(
                'Movie Filters',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          ListTile(
            title: const Text('Display Type'),
            trailing: DropdownButton(
              dropdownColor: const Color.fromARGB(255, 184, 151, 149),
              items: options.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (String? value) {
                setState(() {
                  dropDownValue = value!;
                  if (value == 'Two') {
                    _col = 2;
                  } else if (value == 'Three') {
                    _col = 3;
                  } else if (value == 'Four') {
                    _col = 4;
                  }
                });
              },
              value: dropDownValue,
            ),
          ),
          ExpansionTile(title: const Text('Genre'), children: [
            GridView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisExtent: 65,
              ),
              children: filterGenre
                  .map((genre) => Card(
                        color: Colors.blue,
                        child: Center(
                          child: CheckboxListTile(
                              title: Text(
                                genre['name'],
                                style: const TextStyle(fontSize: 15),
                              ),
                              value: genre['isChecked'],
                              onChanged: (value) {
                                setState(() {
                                
                                  genre['isChecked'] = value;
                                });
                              }),
                        ),
                      ))
                  .toList(),
            ),
          ]),
        ],
      ),
    );
  }
}
