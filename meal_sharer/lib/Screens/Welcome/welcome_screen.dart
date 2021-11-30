import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_sharer/Screens/Sign-up/sign_up_screen.dart';
import 'package:meal_sharer/Screens/Welcome/components/body.dart';
import 'package:meal_sharer/constants.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.userPlus,
          size: size.height * 0.025,
          color: sBackgroundColor,
        ),
        backgroundColor: sPrimaryColor,
        onPressed: () {
          Get.to(() => const SignUpScreen());
        },
      ),
    );
  }
}
