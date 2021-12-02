import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:meal_sharer/Screens/Welcome/welcome_screen.dart';

import 'Constants/firebase_auth_constants.dart';
import 'Controllers/auth_controller.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: const WelcomeScreen(),
    );
  }
}
