import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasestudy2/screens/Home_Page.dart';

import 'package:firebasestudy2/screens/sign_up_veiw.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../staticVar.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

   Signin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!.text,
          password: password!.text,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Get.snackbar(
            "Error !",
            "No user found for that email !",
            backgroundColor: Colors.white,
            colorText: Colors.red,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            duration: const Duration(seconds: 5),
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          Get.snackbar(
            "Error !",
            "Wrong password provided for that user.",
            backgroundColor: Colors.white,
            colorText: Colors.red,
            snackPosition: SnackPosition.TOP,
            icon: const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            duration: const Duration(seconds: 5),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<sController>(
      init: sController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: controller.primColor,

          title: const Text(
            'Sign in',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          //titleSpacing: .5,
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
                  con1: email,
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
                  con1: password,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      "If You Don't Have Account ",
                      style: TextStyle(
                        fontSize: controller.TSize1,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        ' Click Here',
                        style: TextStyle(
                          fontSize: controller.TSize1,
                          color: controller.primColor,
                        ),
                      ),
                      onPressed: () {
                        Get.offAll(SignUp());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // ignore: deprecated_member_use
                // FlatButton(
                //   shape: RoundedRectangleBorder(
                //     side: BorderSide(color: Colors.green.shade400, width: 2),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   padding: const EdgeInsets.all(18),
                //   color: controller.primColor,
                //
                //   child: const Text(
                //     "Sign In",
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    var user = await Signin();
                    if (user != null) {
                      Get.snackbar(
                        "Signed IN ",
                        "Enjoy the App.",
                        backgroundColor: Colors.white,
                        colorText: controller.primColor,
                        snackPosition: SnackPosition.TOP,
                        icon: Icon(
                          Icons.mark_email_read,
                          color: controller.primColor,
                        ),
                        duration: const Duration(seconds: 5),
                      );
                      Get.offAll(HomePage());
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),

                const Center(
                  child: Text(
                    '-OR- ',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(height: 15),
                // ignore: deprecated_member_use
                // FlatButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     side: BorderSide(color: Colors.grey.shade400),
                //   ),
                //   padding: const EdgeInsets.all(18),
                //   color: Colors.grey.shade300,
                //
                //   child: Row(
                //     children: [
                //       Image.asset('assets/images/Google.png'),
                //       const SizedBox(width: 100),
                //       const Text(
                //         "Google Sign In",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //         ),
                //
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    UserCredential cred = await signInWithGoogle();
                    // ignore: avoid_print
                    print(cred);
                    Get.snackbar(
                      "Signed IN ",
                      "Enjoy the App.",
                      backgroundColor: Colors.white,
                      colorText: controller.primColor,
                      snackPosition: SnackPosition.TOP,
                      icon: Icon(
                        Icons.mark_email_read,
                        color: controller.primColor,
                      ),
                      duration: const Duration(seconds: 5),
                    );

                    Get.offAll(HomePage());
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),

                const Center(
                  child: Text(
                    '-OR- ',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(height: 15),
                Divider(color: Colors.grey.shade300, thickness: 1),
                const SizedBox(height: 15),
                // ignore: deprecated_member_use
                // InkWell(
                //   onTap: () async {},
                //   child: FittedBox(
                //     child: Container(
                //       height: 20,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(2),
                //         border: Border.fromBorderSide(
                //             BorderSide(color: Colors.grey.shade400,width: .4),),
                //         color: Colors.grey.shade300,
                //       ),
                //       padding: const EdgeInsets.all(2),
                //       child: Center(
                //         child: Row(
                //           children: [
                //             Image.asset('assets/images/Facebook.png',scale: 1),
                //             const SizedBox(width: 10),
                //             const Text(
                //               "Facebook Sign In",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 8,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
