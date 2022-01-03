import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_sharer/Screens/Welcome/welcome_screen.dart';

import 'Constants/firebase_auth_constants.dart';
import 'Controllers/auth_controller.dart';
import 'constants.dart';

void main() async {
  // this is the main function where the app starts
  // first making sure that the widgets are binded. Returns an instance of the [WidgetsBinding], creating and initializing it if necessary.
  //If one is created, it will be a [WidgetsFlutterBinding]. If one was previously initialized, then it will at least implement [WidgetsBinding]
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    // Injects an authController in memory
    Get.put(AuthController());
  });
  // runs the MyApp stateless widget
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // added GetMaterialApp for the getx state management system
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Sharer',
      // themedata added
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: sPrimaryColor,
        ),
        scaffoldBackgroundColor: sBackgroundColor,
        primaryColor: sPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: sTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // this is the home screen of the app
      home: const WelcomeScreen(),
    );
  }
}
