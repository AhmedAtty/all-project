import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/category_details.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/models/responses/data_response.dart';
import 'package:smm_app/models/service.dart';
import 'package:smm_app/screens/auth_screen.dart';

class ServicesProvider with ChangeNotifier {
  List<Service> services = [];

  Future<void> getCategoryServices(BuildContext context,
      {required int categoryId}) async {
    if (services.isEmpty || services[0].catId! != categoryId) {
      services.clear();
      EasyLoading.show();
      final ApiResponse apiResponse =
          await NetworkRepo().getCategoryServices(categoryId);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        DataResponse<CategoryDetails> categoryDetailsResponse =
            DataResponse.fromJson(
                apiResponse.response!.data,
                (json) =>
                    CategoryDetails.fromJson(json as Map<String, dynamic>));
        services = categoryDetailsResponse.data!.services!;
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
