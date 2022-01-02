import 'package:get/get.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Home/home_screen.dart';

class UserDataUtil {
  static saveUserInfo(String name, String contactNumber, String bio) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      "name": name,
      "contactNumber": contactNumber,
      "bio": bio,
    });
    Get.offAll(() => const HomeScreen());
  }

  static getUserInfo() async {
    return await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((document) {
      final data = document.data();

      return data;
    });
  }
}
