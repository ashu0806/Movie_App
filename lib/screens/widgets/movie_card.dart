// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/localMovieData/fake_data.dart';
import 'package:movie_app/screens/details_screen.dart';

class MoviesCard extends StatelessWidget {
  MoviesCard({Key? key}) : super(key: key);
  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Positioned(
        bottom: 0,
        height: height * 0.7,
        width: width,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsScreen(moviesDetails: fakedata[currentIndex])));
          },
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
                height: height / 1.6,
                aspectRatio: 16 / 9,
                viewportFraction: 0.75,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  changeIndex(index);
                }),
            items: fakedata.map((movie) {
              return Builder(
                builder: (context) {
                  return Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: 300,
                            width: width,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              movie.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            movie.type,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 2, 49, 110),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    Text(
                                      movie.imdbRating.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_filled,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text(
                                      movie.timeDuration.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.play_circle_filled,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    Text(
                                      "Watch",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ));
  }
}
