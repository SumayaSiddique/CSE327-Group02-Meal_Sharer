import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Background/background_2.dart';
import 'package:meal_sharer/Screens/Forgot%20password/forget_password_screen.dart';
import 'package:meal_sharer/constants.dart';

//This class define login Form widget.
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

// This class holds data related to the form.
class _LogInScreenState extends State<LogInScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the login form.
  final _formKey = GlobalKey<FormState>();
  //variable decleared for email
  String email = '';
  //variable decleared for password
  String password = '';

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
                        SvgPicture.asset('assets/icons/login.svg'),
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
                              //This is email textformfield
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
                                // The validator receives the text that the user has entered.
                                validator: EmailFieldValidator.validate,
                              ),
                            ),
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
                              //This is Password textformfield
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Password",
                                  suffixIcon: Icon(
                                    Icons.password,
                                  ),
                                ),
                                onChanged: (value) {
                                  password = value;
                                },
                                // The validator receives the text that the user has entered.
                                validator: PasswordFieldValidator.validate,
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
                                //if the user filled up all the required textfield
                                if (_formKey.currentState!.validate()) {
                                  //save user information in database
                                  authController.login(email, password);
                                }
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: TextButton(
                              onPressed: () {
                                //This will navigate to the Forget Password Screen
                                Get.to(() => const ForgetPasswordScreen());
                              },
                              child: const Text(
                                'forgot password?',
                                style: TextStyle(
                                  color: sPrimaryColor,
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Rounded',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                //log in with google and save user data to database
                                authController.signInWithGoogle();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.googlePlusG,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Login with Google',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// this is validating the email textformfield
class EmailFieldValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    return value.isEmpty ? 'Email can not be empty!' : null;
  }
}

// this is validating the Password textformfield
class PasswordFieldValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    return value.isEmpty ? 'Password can not be empty!' : null;
  }
}
