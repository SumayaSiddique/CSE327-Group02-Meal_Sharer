import 'package:flutter/material.dart';
import 'package:meal_sharer/constants.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset("assets/images/forgot_password.png"),
              const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 25,
                  color: sPrimaryColor,
                  fontFamily: 'SF Pro Rounded',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Opacity(
                opacity: 0.7,
                child: Text(
                  "Enter the email associated with your account and we'll send an email with instructions to rest your password.",
                  style: TextStyle(
                    fontSize: 18,
                    color: sTextColor,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              // SizedBox(height: 24),
              const SizedBox(height: 20),
              SizedBox(
                height: 70,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 4,
                    ),
                    fillColor: sTextColor2,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: sTextColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 240,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: sPrimaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Get.to(() => const LogInScreen());
                    },
                    child: const Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: sBackgroundColor,
                        fontSize: 22,
                        fontFamily: 'SF Pro Rounded',
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
