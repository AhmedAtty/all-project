import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:salah/times.dart';



class Api {
   Future<Map> getSalahTimes() async {
    // String apiKey = "145d5f2c4805460fa497f10f8974302c#";
    var url = Uri.parse(
        'https://api.pray.zone/v2/times/day.json?city=cairo&date=2022-03-25');
    var res = await http.get(url);
    var resBody = json.decode(res.body);

    print(resBody["results"]["datetime"][0]["times"]);


    Map map ={};

    map = await resBody["results"]["datetime"][0]["times"];

    // for (var i in resBody["results"]["datetime"][0]["times"]) {
    //   map.addAll(Times.fromMap(i));
    // }

    return map ;
  }}