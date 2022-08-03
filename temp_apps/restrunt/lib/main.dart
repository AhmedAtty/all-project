import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restrunt/object.dart';
import 'package:restrunt/textf.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<object> list = [];
  File? file;

  void pickCamera() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      file = File(myfile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: formstate,
          child: Column(
            children: [
              SizedBox(height: 20),
              buildTextF(
                icon: Icons.lock_clock_outlined,
                con1: title,
                hText: "insert Title",
                text: "Title",
                type: TextInputType.text,
                vald: (val) {},
                color: primColor,
              ),
              buildTextF(
                icon: Icons.lock_clock,
                con1: description,
                hText: "insert Description",
                text: "Description",
                type: TextInputType.text,
                vald: (val) {},
                color: primColor,
              ),
              ElevatedButton(
                  onPressed: () async {
                    pickCamera();
                  },
                  child: Text("pick Image")),
              ElevatedButton(
                onPressed: () {
                  var formdata = formstate.currentState;
                  if (formdata!.validate()) {
                    formdata.save();
                    setState(() {
                      if (file != null) {
                        list.add(object(
                            title: title.text,
                            image: file!,
                            description: description.text));
                      }
                    });
                  }
                },
                child: Text("Save"),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      if (list[index].image != null) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(children: [
                                    Container(
                                      height: 190,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: FileImage(list[index].image),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        list[index].title,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),

                                  ]),
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Text(
                                      list[index].title,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      list[index].description,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
