import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_sharer/Constants/firebase_auth_constants.dart';
import 'package:meal_sharer/Screens/Home/home_screen.dart';
import 'package:meal_sharer/Screens/Sign-up/collect_user_information.dart';
import 'package:meal_sharer/Screens/Welcome/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  //Creating an instance for the auth controller
  static AuthController instance = Get.find();
  //A user account from fribase auth
  late Rx<User?> firebaseUser;
  //A user from google signin
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
          // if the user is found then the user is navigated to the home Screen
          Get.offAll(() => const HomeScreen());
        } else {
          // if the user is not found then the user is navigated to the CollectUserInformation Screen
          Get.offAll(() => const CollectUserInformation());
        }
      });
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) async {
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
  // signin with google
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

        await auth.signInWithCredential(credential).catchError((onErr) {});
      }
    }
    //If there is an error then show the dialogue
    catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //Register with name, contact number, email & password
  void register(
      String email, String name, String contactNumber, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseFirestore.instance.collection('users').doc().set({
        "email": email,
        "name": name,
        "contactNumber": contactNumber,
        "bio": "This is your bio.",
      });
    }
    //If there is an error then show the dialogue
    catch (firebaseAuthException) {
      throw Exception(firebaseAuthException.toString());
    }
  }

  //login with email & password
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    //If there is an error then show the dialogue
    catch (firebaseAuthException) {
      throw Exception(firebaseAuthException.toString());
    }
  }

  //Sign Out
  void signOut() async {
    //If there is any google sign in account then disconnect that google account
    if (googleSign.currentUser != null) {
      await googleSign.disconnect();
    }
    await auth.signOut();
  }

  //Reset password with registered email
  void resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
