import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasestudy2/screens/sign_in_veiw.dart';
import 'package:firebasestudy2/staticVar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  var u = FirebaseAuth.instance.currentUser;

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }

  getData() async {
    CollectionReference usersref =
        FirebaseFirestore.instance.collection('users');
    await usersref.where('username',isEqualTo: 'atty',).get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        print("===========================================");
      });
    });


  }

  @override
  void initState() {
    getUser();

    //uper.initSta=te();
  }

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<sController>(
      init: sController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: [
            const Center(
              child: Text("Sign out"),
            ),
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.snackbar(
                    "Signed Out ",
                    "You Should Sign In.",
                    backgroundColor: Colors.white,
                    colorText: controller.primColor,
                    snackPosition: SnackPosition.TOP,
                    icon: Icon(
                      Icons.mark_email_read,
                      color: controller.primColor,
                    ),
                    duration: const Duration(seconds: 5),
                  );
                  Get.offAll(SignIn());
                },
                icon: const Icon(Icons.exit_to_app)),
          ],
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: Text("aaa")),
            Text(u!.email.toString()),
          ],
        )),
      ),
    );
  }
}
