import 'package:flutter/material.dart';
import 'package:movie_app/screens/widgets/background_image.dart';
import 'package:movie_app/screens/widgets/faded_widget.dart';
import 'package:movie_app/screens/widgets/movie_card.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(children: [
            const BackGroundImagePage(),
            const FadeWidget1(),
            MoviesCard(),
          ]),
        ),
      ),
    );
  }
}
