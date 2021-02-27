import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/Auth/login.dart';

import 'main_screen.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  image: DecorationImage(
                      image: AssetImage("assets/splash.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 15),
            Text(
              "Wellcome",
              style: TextStyle(
                  fontFamily: "PottaOne",
                  fontSize: 30,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7),
            Text(
              "Discover Your News whitch near you on Your Country!!",
              style: TextStyle(
                  fontFamily: "Courgette",
                  fontWeight: FontWeight.bold,
                  wordSpacing: 5),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SpinKitDoubleBounce(
                color: Color(0xFF242526),
              ),
            )
          ],
        ),
      ),
    );
  }
}
