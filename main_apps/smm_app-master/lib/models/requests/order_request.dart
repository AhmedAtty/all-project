import 'package:smm_app/models/service.dart';

class OrderRequest {
  Service service;
  int quantity;

  OrderRequest({required this.service, required this.quantity});
}
