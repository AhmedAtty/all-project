
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/article.dart';


class Api {
  Future<List<Article>> getNewsGeneral() async {
    String apiKey = "145d5f2c4805460fa497f10f8974302c#";
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=$apiKey');
    var res = await http.get(url);
    var resBody = json.decode(res.body);

    print(resBody["articles"][0]["author"]);
    print(resBody["articles"][0]["url"]);
    print(resBody["articles"][0]["urlToImage"]);

    List<Article> list = [];

    for (var i in resBody["articles"]) {
      list.add(Article.fromMap(i));
    }

    return list;
  }

  Future<List<Article>> getNewsCategory(String category) async {
    String apiKey = "145d5f2c4805460fa497f10f8974302c#";
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey');
    var res = await http.get(url);
    var resBody = json.decode(res.body);

    print(resBody["articles"][0]["author"]);
    print(resBody["articles"][0]["url"]);
    print(resBody["articles"][0]["urlToImage"]);

    List<Article> list = [];

    for (var i in resBody["articles"]) {
      list.add(Article.fromMap(i));
    }

    return list;
  }
}
