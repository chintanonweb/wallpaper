import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpapers/screens/BottomNavBar.dart';
import 'package:theme_provider/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  ThemeConsumer(child: new BottomNavBar()),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Hero(
              tag: 'hero1',
              child: Image(image: ExactAssetImage('assets/images/splash.png', scale: 0.3, )),
            ),
            Hero(
              tag: "hero2",
              child: Text(
                "Wallpaper",
                style: TextStyle(
                    fontFamily: 'Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 64),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
