import 'dart:async';


enum NavBarItem { home, movies }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.home;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int index) {
    switch (index) {
      case 0:
        _navBarController.sink.add(NavBarItem.home);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.movies);
        break;
    }
  }

  close() {
    _navBarController.close();
  }
}
