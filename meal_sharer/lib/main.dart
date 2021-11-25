import 'package:flutter/material.dart';
import 'package:meal_sharer/Screens/Login/login_screen.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Sharer',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: sPrimaryColor,
        ),
        scaffoldBackgroundColor: sBackgroundColor,
        primaryColor: sPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: sTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
