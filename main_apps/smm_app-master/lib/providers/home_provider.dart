import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/category.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/models/responses/data_response.dart';
import 'package:smm_app/models/service.dart';
import 'package:smm_app/models/user.dart';
import 'package:smm_app/screens/auth_screen.dart';
import 'package:smm_app/utils/preferences_manager.dart';

class HomeProvider with ChangeNotifier {
  List<Category> categories = [];
  List<Service> offers = [];
  bool isPop = false;
  bool profileLoaded = false;

  Future<void> getCategories(BuildContext context) async {
    if (categories.isEmpty) {
      EasyLoading.show();
      final ApiResponse apiResponse = await NetworkRepo().getCategories();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        DataResponse<List<Category>> categoriesResponse = DataResponse.fromJson(
            apiResponse.response!.data,
            (json) => (json as List<dynamic>)
                .map((e) => Category.fromJson(e))
                .toList());
        categories = categoriesResponse.data!;
      } else if (apiResponse.error != null) {
        if (apiResponse.error is Map<String, dynamic>) {
          Map<String, dynamic> errors =
              apiResponse.error as Map<String, dynamic>;
          if (errors['status_code'] == 401) {
            EasyLoading.dismiss();
            if (!isPop) {
              isPop = true;
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const AuthScreen(),
                  ),
                  (route) => false);
            }
          }
        }
      }
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  Future<void> getOffers(BuildContext context) async {
    if (offers.isEmpty) {
      EasyLoading.show();
      final ApiResponse apiResponse = await NetworkRepo().getOffers();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        DataResponse<List<Service>> offersResponse = DataResponse.fromJson(
            apiResponse.response!.data,
            (json) => (json as List<dynamic>)
                .map((e) => Service.fromJson(e))
                .toList());
        offers = offersResponse.data!;
      } else if (apiResponse.error != null) {
        if (apiResponse.error is Map<String, dynamic>) {
          Map<String, dynamic> errors =
              apiResponse.error as Map<String, dynamic>;
          if (errors['status_code'] == 401) {
            EasyLoading.dismiss();
            if (!isPop) {
              isPop = true;
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const AuthScreen(),
                  ),
                  (route) => false);
            }
          }
        }
      }
      EasyLoading.dismiss();
      notifyListeners();
    }
  }

  Future<void> getUserProfile(BuildContext context) async {
    if (!profileLoaded) {
      final ApiResponse apiResponse = await NetworkRepo().getUserProfile();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        DataResponse<User> profileResponse = DataResponse.fromJson(
            apiResponse.response!.data,
            (json) => User.fromJson(json as Map<String, dynamic>));
        PreferencesManager.save(profileResponse.data!);
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
      profileLoaded = true;
    }
  }
}
