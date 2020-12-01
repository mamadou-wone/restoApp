import 'package:flutter/material.dart';
import 'package:restoapp/product_home.dart';
import 'package:splashscreen/splashscreen.dart';

class SlashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new ProductHomePage(),
      // title: Text("Boss"),
      // loadingText: Text("WONE"),
      // backgroundColor: Colors.indigo[900],
      imageBackground: AssetImage("assets/on1.png"),
      useLoader: true,
      loaderColor: Colors.white,
      // image: new Image.asset("assets/on1.png"),
    );
  }
}
