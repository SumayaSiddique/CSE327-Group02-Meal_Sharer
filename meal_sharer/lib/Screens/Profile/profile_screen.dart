import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Background/background_2.dart';
import 'package:meal_sharer/Screens/Sign-up/collect_user_information.dart';
import 'package:meal_sharer/Util/profile_info/user_info.dart';
import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                const SizedBox(
                  height: 40,
                ),
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
                      onPressed: () {
                        Get.to(() => const CollectUserInformation());
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: sPrimaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      icon: const Icon(
                        Icons.power_settings_new_outlined,
                        color: sPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const Image(
                      height: 120,
                      width: 120,
                      image: AssetImage(
                        'assets/images/profile.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                FutureBuilder(
                  future: UserDataUtil.getUserInfo(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                children: [
                                  const SizedBox(width: 7),
                                  Text(
                                    snapshot.data!['name'].toString(),
                                    style: const TextStyle(
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
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                snapshot.data!['bio'].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: sPrimaryColor,
                                ),
                                textAlign: TextAlign.justify,
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
                              child: Center(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 7),
                                    Text(
                                      snapshot.data!['contactNumber']
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: sPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
