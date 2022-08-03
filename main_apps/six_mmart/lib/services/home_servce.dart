
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sex_smart/helper/dio_helper.dart';
import 'package:sex_smart/helper/response_model.dart';
import 'package:sex_smart/model/catgory/data_catgory.dart';
import 'package:sex_smart/model/catgory/response_catgory.dart';
import 'package:sex_smart/model/model_home.dart';




class ServiceData{


  Future <List<CatgoryHome>> getProduct()async{
    List<CatgoryHome> list =[];
    var res =await DioHelper.getData(url: 'vendor/types');
    var data =jsonDecode(res.data) as List;
    for(var item in data){
      list.add(CatgoryHome.fromJson(item));
    }
    print("the legnth is ${list.length}");

    return list;
  }




  Future<List<DataCatgory>> getCatgory() async {
    ResponseModel response = await DioHelper.getData(url: 'categories');
    ResponseCatgory responseModel = ResponseCatgory.fromJson(jsonDecode(response.data) as Map<String,dynamic>);
    return responseModel.data!;
  }
}
    