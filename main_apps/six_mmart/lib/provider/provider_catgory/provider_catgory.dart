import 'package:flutter/cupertino.dart';
import 'package:sex_smart/model/catgory/data_catgory.dart';
import 'package:sex_smart/services/home_servce.dart';

class ProviderCatgory extends ChangeNotifier{

  ServiceData service=ServiceData();
  List<DataCatgory> list =[];
  var loadingData=true;


  getCatgory()async{
    loadingData =true;
    list =await service.getCatgory();
    loadingData=false;
    notifyListeners();
  }

}