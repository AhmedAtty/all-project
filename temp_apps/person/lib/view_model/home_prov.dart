import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:person/models/person_model.dart';

import '../models/post_model.dart';

class HomeProv extends ChangeNotifier {
  HomeProv() {
    getPersonList();
    getPostList();
  }

  Dio? _dio = Dio();

  List<Person> personList = [];

  List<Post> postList = [];

  String urlperson =
      'https://my-json-server.typicode.com/SharminSirajudeen/test_resources/users';

  String urlpost =
      'https://my-json-server.typicode.com/SharminSirajudeen/test_resources/posts';

  Future<List<Person>> getPersonList() async {
    Response response = await _dio!.get(urlperson);
    List<dynamic> data = response.data;

    for (var dc in data) {
      personList.add(Person.fromMap(dc));
    }
    print(personList.map((e) => e.toMap()));

    notifyListeners();

    return personList;
  }

  Future<List<Post>> getPostList() async {
    Response response = await _dio!.get(urlpost);
    List<dynamic> data = response.data;

    for (var dc in data) {
      postList.add(Post.fromMap(dc));
    }
    print(postList.map((e) => e.toMap()));
    notifyListeners();

    return postList;
  }
}
