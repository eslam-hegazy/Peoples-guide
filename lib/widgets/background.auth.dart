import 'package:flutter/cupertino.dart';

class background_auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/top1.png"),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/top2.png"),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Image.asset("assets/main.png", width: 120, height: 120),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/bottom1.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/bottom2.png"),
          ),
        ],
      ),
    );
  }
}
