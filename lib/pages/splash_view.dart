import 'package:flutter/material.dart';
import 'package:restoapp/home.dart';
import 'package:splashscreen/splashscreen.dart';

class SlashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new Home(),
      title: Text(
        'BonCoin',
        style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            color: Colors.teal),
      ),
      // loadingText: Text("WONE"),
      backgroundColor: Colors.white,
      imageBackground: AssetImage("assets/on4.png"),
      useLoader: true,
      loaderColor: Colors.white,
      // image: new Image.asset("assets/on1.png"),
    );
  }
}
