import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getAllData();
  }

  final String apiKey = 'ffd45d74f14fca12a6d153a2bd915500';

  List<Movie> movieList = [];
  List<Movie> movieList2 = [];
  List<Movie> movieList3 = [];

  Future<void> getMovie(int pageNum) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=$pageNum");
    var res = await http.get(url);
    var resBody = json.decode(res.body);

    print(resBody["results"][0]["title"]);

    if (pageNum == 1) {
      for (var i in resBody["results"]) {
        movieList.add(Movie.fromMap(i));
      }
    }
    if (pageNum == 2) {
      for (var i in resBody["results"]) {
        movieList2.add(Movie.fromMap(i));
      }
    }
    if (pageNum == 3) {
      for (var i in resBody["results"]) {
        movieList3.add(Movie.fromMap(i));
      }
    }
  }

  Future<String> getWatchKey(int id) async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey&language=en-US");
    var res = await http.get(url);
    var resBody = json.decode(res.body);
    return resBody["results"][0]["key"];
  }

  Future<void> getAllData() async {
    await getMovie(1);
    await getMovie(2);
    await getMovie(3);
    notifyListeners();
  }
}
