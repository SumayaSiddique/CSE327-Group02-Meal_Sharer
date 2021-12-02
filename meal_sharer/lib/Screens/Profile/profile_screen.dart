import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_sharer/Screens/Background/background_2.dart';
import 'package:meal_sharer/Screens/Welcome/components/welcome_background.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background2(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: sPrimaryColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: sPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Image.asset("assets/images/Profile.png"),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: sPrimaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: const [
                        SizedBox(width: 7),
                        Text(
                          "Kakashi Hatake",
                          style: TextStyle(
                            fontSize: 18,
                            color: sPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Bio",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: sPrimaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: const [
                        SizedBox(width: 7),
                        Text(
                          "I am Kakashi Hatake and am a shinobi of \nKonohagakure's Hatake clan. I am also \nknown as Kakashi of the Sharingan.\nI know the improtance of teamwork.",
                          style: TextStyle(
                            fontSize: 18,
                            color: sPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: sPrimaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: const [
                        SizedBox(width: 7),
                        Text(
                          "KakashioftheSharingan@email.com",
                          style: TextStyle(
                            fontSize: 18,
                            color: sPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Contact Number",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: sPrimaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: const [
                        SizedBox(width: 7),
                        Text(
                          "0123456789",
                          style: TextStyle(
                            fontSize: 18,
                            color: sPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
