import 'package:flutter/material.dart';
import 'package:cobaflutter/homePage.dart';
import 'dart:async';

void main(List<String> args) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'splash screen',
    home: SplashScreenPage(),
  ));
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomePage();
        })
      );
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 300.0),
            child: Column(
                children: [
                new CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60.0,
                  child: Image.asset(
                    "images/mrobj-edit.png",
                    // width: 500.0,
                    // height: 200.0,
                  ),
                ),
                new Text(
                'Mr OBJ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                new Text(
                'Meeting Reservation Online',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                new Text(
                'Booking Jogja',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}