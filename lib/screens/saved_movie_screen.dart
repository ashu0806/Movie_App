import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/model.dart';

class SavedMoviesScreen extends StatelessWidget {
  const SavedMoviesScreen({Key? key, required this.savedlist})
      : super(key: key);
  final List<ModelForMovies> savedlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ((context, index) {
          ModelForMovies movies = savedlist[index];
          return Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              left: 8.w,
              right: 8.w,
            ),
            child: Card(
              color: const Color.fromARGB(255, 219, 217, 217),
              child: SizedBox(
                height: 250.h,
                width: 300.w,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(movies.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  movies.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                Text(
                                  movies.imdbRating.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "Director : ${movies.director}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 1, 38, 68),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        child: SizedBox(
                          child: ListView(
                            children: [
                              Text(
                                movies.desc,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 1, 38, 68),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
        itemCount: savedlist.length,
      ),
    );
  }
}
