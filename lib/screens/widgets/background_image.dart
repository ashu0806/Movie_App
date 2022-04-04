import 'package:flutter/material.dart';

class BackGroundImagePage extends StatelessWidget {
  const BackGroundImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Image.network(
          "https://i.pinimg.com/736x/7e/eb/a4/7eeba468cd2fdca160f55b3878b60699.jpg"),
    );
  }
}
