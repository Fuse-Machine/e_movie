
import 'package:e_movie/data/repositories/repositories.dart';
import 'package:e_movie/presentation/bloc/bloc.dart';
import 'package:e_movie/presentation/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case NavBarItem.home:
                return const MyHomePage();
              case NavBarItem.movies:
                
              return BlocProvider<MoviePageBloc>(
                create: (context) => MoviePageBloc(repository: MovieRepository())
                  ..add(
                    FetchMovie(),
                  ),
                  child: const MoviesPage(),
              );

              default:
                return Container();
            }
          }),
      bottomNavigationBar: StreamBuilder(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            return Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 0.5, color: Colors.grey.withOpacity(0.4)))),
              child: BottomNavigationBar(
                elevation: 0.9,
                iconSize: 21,
                unselectedFontSize: 10.0,
                selectedFontSize: 10.0,
                type: BottomNavigationBarType.fixed,
                currentIndex: snapshot.data!.index,
                onTap: _bottomNavBarBloc.pickItem,
                items: [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: SizedBox(
                      child: Icon(
                        Icons.home,
                        color: Colors.grey.shade700,
                        size: 25,
                      ),
                    ),
                    activeIcon: const SizedBox(
                      child: Icon(
                        Icons.home,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "Movies",
                    icon: Icon(
                      Icons.movie,
                      color: Colors.grey.shade700,
                      size: 25,
                    ),
                    activeIcon: const SizedBox(
                      child: Icon(
                        Icons.movie_rounded,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
