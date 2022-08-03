import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/order.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/models/responses/data_response.dart';
import 'package:smm_app/screens/auth_screen.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> orders = [];

  Future<void> getOrders(BuildContext context) async {
    if (orders.isEmpty) {
      EasyLoading.show();
      final ApiResponse apiResponse = await NetworkRepo().getOrders();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        DataResponse<List<Order>> ordersResponse = DataResponse.fromJson(
            apiResponse.response!.data,
            (json) =>
                (json as List<dynamic>).map((e) => Order.fromJson(e)).toList());
        orders = ordersResponse.data!;
      } else if (apiResponse.error != null) {
        if (apiResponse.error is Map<String, dynamic>) {
          Map<String, dynamic> errors =
              apiResponse.error as Map<String, dynamic>;
          if (errors['status_code'] == 401) {
            EasyLoading.dismiss();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => const AuthScreen(),
                ),
                (route) => false);
          }
        }
      }
      EasyLoading.dismiss();
      notifyListeners();
    }
  }
}
