import 'dart:math';

import 'package:clas1/gred.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<String> tx = [];

class _MyHomePageState extends State<MyHomePage> {
  MyHomePage m = const MyHomePage(
    title: "ahmed",
  );
  TextEditingController cont = TextEditingController();

  // List<String> tx = [];

  List<Widget>? txt() {
    List<Widget> list = [];

    for (int i = 0; i < tx.length; i++) {
      print(i);
      list.add(InkWell(
        onTap: () {
          setState(() {
            tx.removeAt(i);
          });
        },
        child: Container(
          width: 150,
          height: 100,
          child: Card(
            child: Column(
              children: [
                Image.network(
                  "https://images.emojiterra.com/google/android-10/512px/1f9cd-2642.png",
                  scale: 10,
                ),
                Text(tx[i]),
              ],
            ),
          ),
        ),
      ));
    }
    return list;
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.to(gred());
          },
        ),
        title: Text("${m.title}"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Form(
            key: formstate,
            child: TextFormField(
              onChanged: (val) {
                setState(() {
                  cont.text = val;
                });
                print(cont.text);
              },
              onSaved: (val) {
                setState(() {
                  cont.text = val!;
                  tx.add(cont.text);
                });
              },
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () async {
              var formdata = formstate.currentState;
              if (formdata!.validate()) {
                formdata.save();
              }
            },
            color: Colors.grey,
            child: const Text("Save"),
          ),
          Column(
            children: txt()!,
          )
        ],
      ),
    );
  }
}
