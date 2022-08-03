import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/requests/update_profile_request.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/models/responses/data_response.dart';
import 'package:smm_app/models/user.dart';
import 'package:smm_app/screens/auth_screen.dart';
import 'package:smm_app/utils/preferences_manager.dart';

class MyAccountProvider with ChangeNotifier {
  bool _isEdit = false;
  late User user;
  bool _init = false;

  bool get isEdit => _isEdit;

  set isEdit(bool value) {
    _isEdit = value;
    notifyListeners();
  }

  void toggleEdit() {
    isEdit = !_isEdit;
  }

  void init() {
    if (!_init) {
      user = User.fromJson(
          PreferencesManager.load(User().runtimeType) as Map<String, dynamic>);
      _init = true;
    }
  }

  Future<void> getUserProfile(BuildContext context) async {
    EasyLoading.show();
    final ApiResponse apiResponse = await NetworkRepo().getUserProfile();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      DataResponse<User> profileResponse = DataResponse.fromJson(
          apiResponse.response!.data,
          (json) => User.fromJson(json as Map<String, dynamic>));
      user = profileResponse.data!;
      PreferencesManager.save(profileResponse.data!);
    } else if (apiResponse.error != null) {
      if (apiResponse.error is Map<String, dynamic>) {
        Map<String, dynamic> errors = apiResponse.error as Map<String, dynamic>;
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

  Future<void> update(BuildContext context,
      {required void Function(bool success, String error) callback}) async {
    UpdateProfileRequest request = UpdateProfileRequest(
      firstName: user.firstName,
      lastName: user.lastName,
      phone: user.phone,
    );
    await updateProfile(context, request: request, callback: callback);
  }

  Future<void> updateProfile(BuildContext context,
      {required UpdateProfileRequest request,
      required void Function(bool success, String error) callback}) async {
    EasyLoading.show();
    final ApiResponse apiResponse =
        await NetworkRepo().updateUserProfile(request);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      DataResponse<User> updateResponse = DataResponse.fromJson(
          apiResponse.response!.data,
          (json) => User.fromJson(json as Map<String, dynamic>));
      await PreferencesManager.save(updateResponse.data!);
      user = updateResponse.data!;
      callback(true, '');
    } else if (apiResponse.error != null) {
      if (apiResponse.error is Map<String, dynamic>) {
        Map<String, dynamic> errors = apiResponse.error as Map<String, dynamic>;
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
