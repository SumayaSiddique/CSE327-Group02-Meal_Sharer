import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meal_sharer/Screens/Forgot%20password/forget_password_screen.dart';

import '../../constants.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // body: const Body(),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.userPlus,
          size: size.height * 0.025,
          color: sBackgroundColor,
        ),
        backgroundColor: sPrimaryColor,
        onPressed: () {
          Get.to(() => const ForgetPasswordScreen());
        },
      ),
    );
  }
}
