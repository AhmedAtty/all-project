import 'package:sex_smart/model/catgory/data_catgory.dart';

class ResponseCatgory {
  List<DataCatgory>? data;

  ResponseCatgory({this.data});

  ResponseCatgory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataCatgory>[];
      json['data'].forEach((v) {
        data!.add(new DataCatgory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}