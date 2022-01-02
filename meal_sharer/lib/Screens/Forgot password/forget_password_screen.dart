import 'package:flutter/material.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Background/background_2.dart';
import 'package:meal_sharer/constants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background2(
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Image.asset("assets/images/forgot_password.png"),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Reset Password",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: sPrimaryColor,
                                  fontFamily: 'SF Pro Rounded',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Opacity(
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  suffixIcon: Icon(
                                    Icons.mail,
                                  ),
                                ),
                                onChanged: (value) {
                                  email = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 55,
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
                                if (_formKey.currentState!.validate()) {
                                  authController.resetPassword(email);
                                }
                              },
                              child: const Text(
                                'Reset Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'SF Pro Rounded',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
