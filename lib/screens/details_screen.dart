import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/model.dart';
import 'package:movie_app/screens/saved_movie_screen.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key, required this.moviesDetails})
      : super(key: key);
  final ModelForMovies moviesDetails;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    List<ModelForMovies> savedMovies = [];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
          actions: [
            SizedBox(
              width: 80.w,
              child: Row(children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    savedMovies.add(
                      ModelForMovies(
                        title: widget.moviesDetails.title,
                        image: widget.moviesDetails.image,
                        type: widget.moviesDetails.type,
                        imdbRating: widget.moviesDetails.imdbRating,
                        timeDuration: widget.moviesDetails.timeDuration,
                        director: widget.moviesDetails.director,
                        writer: widget.moviesDetails.writer,
                        desc: widget.moviesDetails.desc,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Movie Saved Successfully")));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SavedMoviesScreen(
                                savedlist: savedMovies,
                              )),
                    );
                  },
                  child: const Icon(
                    Icons.bookmark_add_outlined,
                    color: Colors.black,
                  ),
                )
              ]),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: FadeInDown(
                    // delay: const Duration(seconds: 2),
                    child: Container(
                      width: width,
                      height: 520.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.moviesDetails.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: 300.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        ZoomIn(
                          delay: const Duration(seconds: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Director : ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.moviesDetails.director,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 2, 37, 133),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ZoomIn(
                          delay: const Duration(seconds: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Writer : ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.moviesDetails.writer,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 2, 37, 133),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInUpBig(
                              delay: const Duration(seconds: 1),
                              child: SizedBox(
                                height: 200.h,
                                child: ListView(
                                  children: [
                                    Text(
                                      widget.moviesDetails.desc,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 380.h,
                  left: 10.w,
                  child: FadeInLeftBig(
                    delay: const Duration(seconds: 1),
                    child: Container(
                      height: 40.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 230, 0),
                            size: 20,
                          ),
                          Text(
                            widget.moviesDetails.imdbRating.toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 2, 37, 133),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 380.h,
                  left: 100.w,
                  child: FadeInRightBig(
                    delay: const Duration(seconds: 1),
                    child: Container(
                      height: 40.h,
                      width: 160.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 230, 0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Time Duration : ${widget.moviesDetails.timeDuration}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 2, 37, 133),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
