import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_sharer/Screens/Login/login_screen.dart';
import 'package:meal_sharer/constants.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'lottie/donate.json',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            // const Spacer(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.030, bottom: size.height * 0.115),
                child: const Text(
                  '  Small contribution can\ndefeat a person\'s hunger',
                  style: TextStyle(
                    color: sPrimaryColor,
                    fontSize: 25,
                    fontFamily: 'SF Pro Rounded',
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.60,
              left: size.width / 10,
              width: size.width * 0.80,
              height: size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: sPrimaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(() => const LogInScreen());
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: sBackgroundColor,
                    fontSize: 24,
                    fontFamily: 'SF Pro Rounded',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
