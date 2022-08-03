import 'package:flutter/cupertino.dart';
import 'package:sex_smart/model/model_home.dart';
import 'package:sex_smart/services/home_servce.dart';



class HomeViewModel extends ChangeNotifier{

  ServiceData service=ServiceData();
  List<CatgoryHome> list =[];
  var loadingData=true;


  getProduct()async{
    loadingData =true;
    list =await service.getProduct();
    loadingData=false;
    notifyListeners();
  }




}


