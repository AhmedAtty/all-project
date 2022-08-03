import 'package:sex_smart/model/catgory/vendor_type.dart';

class DataCatgory {
  int? id;
  Null? categoryId;
  VendorType? vendorType;
  String? name;
  String? photo;
  String? color;

  DataCatgory(
      {this.id,
        this.categoryId,
        this.vendorType,
        this.name,
        this.photo,
        this.color});

  DataCatgory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    vendorType = json['vendor_type'] != null
        ? new VendorType.fromJson(json['vendor_type'])
        : null;
    name = json['name'];
    photo = json['photo'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    if (this.vendorType != null) {
      data['vendor_type'] = this.vendorType!.toJson();
    }
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['color'] = this.color;
    return data;
  }
}