import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Home/home_screen.dart';
import 'package:meal_sharer/Screens/Sign-up/collect_user_information.dart';
import 'package:meal_sharer/Screens/Welcome/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) async {
    print("Initial Screen function");
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const WelcomeScreen());
    } else {
      // check if user is a new user. if it's a new user then collect more information

      // if the user exists and logged in the the user is navigated to the platform selection screen

      await firebaseFirestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((doc) async {
        if (doc.exists) {
          Get.offAll(() => const HomeScreen());
        } else {
          Get.offAll(() => const CollectUserInformation());
        }
      });
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) async {
    print("Google initial Screen function");

    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const WelcomeScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the platform selection screen
      await firebaseFirestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get()
          .then((doc) async {
        if (doc.exists) {
          Get.offAll(() => const HomeScreen());
        } else {
          Get.offAll(() => const CollectUserInformation());
        }
      });
    }
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => const WelcomeScreen());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => const HomeScreen());
  //   }
  // }

  // _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
  //   print(googleSignInAccount);
  //   if (googleSignInAccount == null) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => const WelcomeScreen());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => const HomeScreen());
  //   }
  // }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(
      String email, String name, String contactNumber, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseFirestore.instance.collection('users').doc().set({
        "email": email,
        "name": name,
        "contactNumber": contactNumber,
      });
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await googleSign.disconnect();
    await auth.signOut();
  }

  void resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
