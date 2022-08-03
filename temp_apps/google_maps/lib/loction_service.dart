//  // import 'package:dio/dio.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class LoctionService {
//    // Dio? _dio = Dio();
//   final String key = 'AIzaSyBCkrxCRAFkgdlSx5Ip9yMzqx1la3fKPEA';
//
//   Future<String> getPlaceId(String input) async {
//     final String url =
//         "https://maps.googleapis.com/maps/api/place/details/json?input=$input&inputtype=textquery&key=$key";
//
//     // Response response = await  _dio!.get(url);
//
//     http.Response response = await  http.get(Uri.parse(url));
//
//     var resjson = jsonDecode(response.body);
//
//     String placeId =(resjson['candidates'][0]["place_id"])as String;
//
//     print(placeId);
//
//     return placeId;
//   }
//
// //Future<Map<String,dynamic>> getPlaceId(String input) async {}
// }
