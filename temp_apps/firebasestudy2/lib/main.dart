import 'package:firebase_core/firebase_core.dart';
import 'package:firebasestudy2/screens/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasestudy2/screens/sign_up_veiw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool? isLogIn;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: user == null ? SignUp() : HomePage(),
  ));
}
