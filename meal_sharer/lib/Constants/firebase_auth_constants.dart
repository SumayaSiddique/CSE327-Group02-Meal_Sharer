import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_sharer/Controllers/auth_controller.dart';

AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
GoogleSignIn googleSign = GoogleSignIn();
