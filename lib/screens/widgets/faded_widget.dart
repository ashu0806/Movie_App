import 'package:flutter/material.dart';

class FadeWidget1 extends StatelessWidget {
  const FadeWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 212, 211, 211).withOpacity(1),
              const Color.fromARGB(255, 255, 253, 253).withOpacity(1),
              const Color.fromARGB(255, 202, 201, 201).withOpacity(0),
              const Color.fromARGB(255, 156, 154, 154).withOpacity(0),
              const Color.fromARGB(255, 121, 120, 120).withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeWidget2 extends StatelessWidget {
  const FadeWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 212, 211, 211).withOpacity(1),
              const Color.fromARGB(255, 255, 253, 253).withOpacity(0),
              const Color.fromARGB(255, 202, 201, 201).withOpacity(0),
              const Color.fromARGB(255, 156, 154, 154).withOpacity(0),
              const Color.fromARGB(255, 121, 120, 120).withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
