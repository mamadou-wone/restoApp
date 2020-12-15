import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restoapp/pages/splash_view.dart';

// 07/12/2020
// 08/12/2020
// 09/12/2020
// 10/12/2020
// 11/12/2020
// 11/12/2020
// 13/12/2020
// 13/12/2020
// 14/12/2020
// 14/12/2020
void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
