import 'package:e_movie/data/models/models.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterGenre extends StatelessWidget {
  List<Genre> genre;
  FilterGenre({
    Key? key,
    required this.genre,
  }) : super(key: key);
  List<Map> genreFilter = [];
  @override
  Widget build(BuildContext context) {
    _initialization();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        leading: const Icon(Icons.back_hand),
      ),
    );
  }

  void _initialization() {
    for (var element in genre) {
      genreFilter.add({
        'name': element.name,
        'isChecked': false,
      });
    }
  }
}
