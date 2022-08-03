import 'dart:math';

import 'package:clas1/main.dart';
import 'package:flutter/material.dart';

class gred extends StatefulWidget {
  const gred({
    Key? key,
  }) : super(key: key);

  @override
  _gredState createState() => _gredState();
}

class _gredState extends State<gred> {
  TextEditingController cont = TextEditingController();

  // List<String> tx =[];

  //final Color color1 = Colors.white;
  List<Widget>? txt() {
    List<Widget> list = [];

    for (int i = 0; i < tx.length; i++) {
      list.add(InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            tx.removeAt(i);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.greenAccent.withOpacity(.3),
                Colors.greenAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.greenAccent,
          ),
          child: Column(
            children: [
              SizedBox(height: 8),
              Image.network(
                "https://images.emojiterra.com/google/android-10/512px/1f9cd-2642.png",
                scale: 10,
              ),
              Text("""${tx[i]}
user numer ${i + 1}"""),
            ],
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: txt()!,
        ),
      ),
    );
  }
}
