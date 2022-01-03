import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Background/background_1.dart';
import '../../constants.dart';

//This class define SignUp Form widget.
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

// This class holds data related to the form.
class _SignUpScreenState extends State<SignUpScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the login form.
  final _formKey = GlobalKey<FormState>();
//variable decleared for email.
  String email = '';
//variable decleared for password.
  String password = '';
//variable decleared for number.
  String number = '';
//variable decleared for name.
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background1(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  SvgPicture.asset('assets/icons/signup.svg'),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            }
                            return null;
                          },
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //This is Name textformfield
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Full Name",
                            suffixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                          // The validator receives the text that the user has entered.
                          validator: NameFieldValidator.validate,
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //This is Number textformfield
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Contact Number",
                            suffixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          onChanged: (value) {
                            number = value;
                          },
                          // The validator receives the text that the user has entered.
                          validator: ContactNumberFieldValidator.validate,
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //This is password textformfield
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
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
                            authController.register(
                              email,
                              name,
                              number,
                              password,
                            );
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'SF Pro Rounded',
                          ),
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
                          //sign up with google and save user data to database
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
                              'Sign Up with Google',
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
      ),
    );
  }
}

// this is validating the Name textformfield
class NameFieldValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    return value.isEmpty ? 'Name can not be empty!' : null;
  }
}

// this is validating the Number textformfield
class ContactNumberFieldValidator {
  static String? validate(String? value) {
    if (value == null) return null;
    return value.isEmpty ? 'Number can not be empty!' : null;
  }
}
