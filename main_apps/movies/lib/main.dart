import 'package:flutter/material.dart';
import 'package:movies/pages/details.dart';
import 'package:movies/providers/home_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: MaterialApp(
      title: "Movies",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(backgroundColor: Colors.cyan),
          preferredSize: Size(size.width, size.height * .08)),
      body: Center(
        child: Container(
          color: Colors.cyan,
          height: size.height * .5,
          width: size.width / 2,
          child: Text(
            "data",
            style: TextStyle(fontSize: size.width * 30 / size.width),
          ),
        ),
      ),
    );
  }
}
