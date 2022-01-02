import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Background/background_2.dart';
import 'package:meal_sharer/Screens/Chat%20Room/chat_room.dart';
import 'package:meal_sharer/Screens/Profile/profile_screen.dart';
import 'package:meal_sharer/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background2(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: 4,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => const ProfileScreen());
                  },
                  icon: const Icon(
                    FontAwesomeIcons.user,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/Homepage.png'),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const Text(
                      "Make good things happen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: const Text(
                        "Meal sharer is the best place for donation whether you are an individual or group or maybe an organization.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Donate\nFood",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: sBackgroundColor,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: sPrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Find\nDonated\nFoods",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: sBackgroundColor,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: sPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      child: const Text("Sign Out!"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const ChatRoom(category: ""));
                      },
                      child: const Text("Sign Out!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
