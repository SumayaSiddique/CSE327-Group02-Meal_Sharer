import 'package:get/get.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Home/home_screen.dart';

class UserDataUtil {
  // a static function to save the data from firestore. Here the doc is filtering with the unique auth uid
  // the bio is stored as a sample bio
  static saveUserInfo(String name, String contactNumber, String bio) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      "name": name,
      "contactNumber": contactNumber,
      "bio": bio,
    });
    Get.offAll(() => const HomeScreen());
  }

//a static function to get  the user data from firestore. Here the doc is filtering with the unique auth uid
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
