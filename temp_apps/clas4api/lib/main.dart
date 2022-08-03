import 'dart:convert';

import 'package:clas4api/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API"),
        ),
      body: FutureBuilder(
        future: GetData(),
        builder: (context,AsyncSnapshot snapshot) {
          if(snapshot.data ==null){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }
}

Future<List<Post>> GetData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  var responseBody = json.decode(response.body);

  List<Post> liiist = [];
  for (var i in responseBody) {
    liiist.add(Post(id: i['id'], title: i['title'], body: i['body']));
  }
  for (var i in liiist) {
    print(i.id);
  }
  print(responseBody[0]['id']);
  return liiist;
}
