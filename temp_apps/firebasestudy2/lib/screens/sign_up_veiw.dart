import 'dart:math';

import 'package:firebasestudy2/screens/sign_in_veiw.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../staticVar.dart';

//import 'package:email_validator/email_validator.dart';
// ignore: constant_identifier_names

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController? myEmail = TextEditingController();
  TextEditingController? myPassword = TextEditingController();
  TextEditingController? myUserName = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<sController>(
      init: sController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: controller.primColor,
          title: const Text('Sign up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formstate,
            child: ListView(
              children: [
                const SizedBox(height: 50),
                controller.buildPadding(
                  icon: Icons.person,
                  text: "UserName :",
                  hText: "Enter your UserName :",
                  vald: (val) {
                    if (val != null) {
                      if (val.length > 100) {
                        return "UserName can't be larger then 100 letter";
                      } else if (val.length < 2) {
                        return "UserName can't be less then 2 letter";
                      } else {
                        return null;
                      }
                    }
                  },
                  con1: myUserName,
                  type: TextInputType.name,
                ),
                const SizedBox(height: 8),
                controller.buildPadding(
                  icon: Icons.email,
                  text: "Email :",
                  hText: "Enter your Email :",
                  vald: (val) {
                    if (val != null) {
                      return controller.validateEmail(val);
                    } else {
                      return null;
                    }
                  },
                  con1: myEmail,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                controller.buildPadding(
                  icon: Icons.key,
                  text: "Password :",
                  hText: "Enter your Password :",
                  vald: (val) {
                    if (val != null) {
                      if (val.length > 100) {
                        return "Password can't be larger then 100 letter";
                      } else if (val.length < 4) {
                        return "Password can't be less then 4 letter";
                      } else {
                        return null;
                      }
                    }
                  },
                  con1: myPassword,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      'If You Have Account ',
                      style: TextStyle(
                        fontSize: controller.TSize,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        ' Click Here',
                        style: TextStyle(
                          fontSize: controller.TSize,
                          color: controller.primColor,
                        ),
                      ),
                      onPressed: () {
                        Get.to(SignIn());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // ignore: deprecated_member_use
                // FlatButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     side: BorderSide(
                //         color: controller.primColor == Colors.pink
                //             ? Colors.pink.shade700
                //             : Colors.green.shade400,
                //         width: 2),
                //   ),
                //   padding: const EdgeInsets.all(18),
                //   color: controller.primColor,
                //
                //   child: const Text(
                //     "Sign Up",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    var formdata = formstate.currentState;
                    if (formdata!.validate()) {
                      formdata.save();

                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: myEmail!.text,
                          password: myPassword!.text,
                        );

                        Get.snackbar(
                          "Signed up ",
                          "You Have Account now.",
                          backgroundColor: Colors.white,
                          colorText: controller.primColor,
                          snackPosition: SnackPosition.TOP,
                          icon: Icon(
                            Icons.mark_email_read,
                            color: controller.primColor,
                          ),
                          duration: const Duration(seconds: 5),
                        );
                        Get.to(SignIn());
                        //return userCredential;
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          Get.snackbar(
                            "Error !",
                            "The password provided is too weak.",
                            backgroundColor: Colors.white,
                            colorText: Colors.red,
                            snackPosition: SnackPosition.TOP,
                            icon: const Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            duration: const Duration(seconds: 5),
                          );
                          // ignore: avoid_print
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          Get.snackbar(
                            "Error !",
                            "The account already exists for that email.",
                            backgroundColor: Colors.white,
                            colorText: Colors.red,
                            snackPosition: SnackPosition.TOP,
                            icon: const Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            duration: const Duration(seconds: 5),
                          );
                          // ignore: avoid_print
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey,
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
