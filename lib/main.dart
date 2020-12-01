import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:restoapp/home.dart';
import 'package:restoapp/modals/product_list.dart';
import 'package:restoapp/pages/splash_view.dart';
import 'package:restoapp/product_home.dart';
import 'package:restoapp/providers/app_provider.dart';
import 'util/const.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          // onGenerateRoute: (settings) {
          //   switch (settings.name) {
          //     case "/home":
          //       return PageTransition(
          //           child: ProductHomePage(),
          //           type: PageTransitionType.leftToRight);
          //       break;
          //     default:
          //       return null;
          //   }
          // },
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: SlashView(),
        );
      },
    );
  }
}
