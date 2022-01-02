import 'package:meal_sharer/Constants/firebase_auth_constants.dart';

class UserDataUtil {
  static saveUserInfo(String email, String name, String contactNumber) async {
    firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      "email": email,
      "name": name,
      "contactNumber": contactNumber,
    });
  }

  static getUserInfo() async {
    firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((document) {
      final data = document.data();
      print(data!['email']);
      return data;
    });
  }
}
