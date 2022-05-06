import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_movie/data/datasources/urls.dart';
import 'package:e_movie/data/models/movie.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpcomingMovie extends StatelessWidget {
  List<Movie> upcoming;
  UpcomingMovie({Key? key, required this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.0,
            aspectRatio: 2 / 2.8,
            // enlargeCenterPage: true,
          ),
          items: upcoming
              .map((movie) => Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 2.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(Urls.imageUrl + movie.poster),
                        ),
                      ),
                      Positioned(
                          top: 10.0,
                          right: 10.0,
                          child: SafeArea(
                            child: Column(
                              children: [
                                Text(
                                  "Release date: ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  movie.releaseDate,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ))
              .toList(),
        ),
        Positioned(
            left: 10.0,
            top: 10.0,
            child: SafeArea(
              child: Text(
                "Upcoming movies",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )),
      ],
    );
  }
}
