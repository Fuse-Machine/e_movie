import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/cast.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CastList extends StatelessWidget {
  List<Cast> cast;
  CastList({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: cast.length,
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
                      child: Stack(
                        children: [
                          Image.network(
                              Urls.imageUrl + cast[index].profilePath),
                          Positioned(
                            bottom: 3.0,
                            left: 3.0,
                            right: 3.0,
                            child: SizedBox(
                              width: 80,
                              child: Text(
                                cast[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
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
