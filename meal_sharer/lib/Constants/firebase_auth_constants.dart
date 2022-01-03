import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_sharer/Controllers/auth_controller.dart';

//Auth controller single instance create
AuthController authController = AuthController.instance;
//firebase initialization
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
//Auth instance
FirebaseAuth auth = FirebaseAuth.instance;
//Firestore single instance create
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//Google signin instance
GoogleSignIn googleSign = GoogleSignIn();
