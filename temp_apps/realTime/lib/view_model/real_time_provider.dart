import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime/models/message.dart';

class RealTimeProvider extends ChangeNotifier {
  RealTimeProvider() {
    dbRef = FirebaseDatabase.instance.ref();

    notifyListeners();
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();

  DatabaseReference? dbRef;

  List<Massege> massedgsList = [];

  createDb(String x) async {
    await FirebaseDatabase.instance
        .ref()
        .child("messages")
        .push()
        .set({"message": x});
  }

  getDb() {
    FirebaseDatabase.instance.ref().child("messages").onValue.listen((event) {
      print(event.snapshot.children);
      massedgsList.clear();
      for (final child in event.snapshot.children) {
        massedgsList.add(Massege.fromMap(child.value! as Map<dynamic, dynamic>));
      }
      notifyListeners();
      print(massedgsList.length);
    },
        //event.snapshot.children.map((e) => e as Map<dynamic, dynamic>);
        onError: (error) {
      print(error);
    });
  }
}
