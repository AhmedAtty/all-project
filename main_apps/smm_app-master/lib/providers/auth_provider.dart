import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/auth_data.dart';
import 'package:smm_app/models/requests/login_request.dart';
import 'package:smm_app/models/requests/register_request.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/models/responses/data_response.dart';
import 'package:smm_app/utils/preferences_manager.dart';

class AuthProvider with ChangeNotifier {
  bool _isLogin = true;
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  late String password;
  bool passwordsMatched = false;

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void toggleLogin() {
    isLogin = !_isLogin;
  }

  Future<void> authenticate(BuildContext context, GlobalKey<FormState> formKey,
      {required void Function(bool success, String error) callback}) async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      if (isLogin) {
        LoginRequest request = LoginRequest(email: email, password: password);
        login(context, request: request, callback: callback);
      } else {
        RegisterRequest request = RegisterRequest(
            password: password,
            email: email,
            firstName: firstName,
            lastName: lastName);
        register(context, request: request, callback: callback);
      }
    }
  }

  Future<void> login(BuildContext context,
      {required LoginRequest request,
      required void Function(bool success, String error) callback}) async {
    EasyLoading.show();
    final ApiResponse apiResponse = await NetworkRepo().login(request);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      DataResponse<AuthData> loginResponse = DataResponse.fromJson(
          apiResponse.response!.data,
          (json) => AuthData.fromJson(json as Map<String, dynamic>));
      await PreferencesManager.save(loginResponse.data!.user!);
      await PreferencesManager.saveString(
          PreferencesManager.token, loginResponse.data!.token!);
      callback(true, '');
    } else if (apiResponse.error != null) {
      if (apiResponse.error is Map<String, dynamic>) {
        Map<String, dynamic> errors = apiResponse.error as Map<String, dynamic>;
        if (errors['status_code'] == 401) {
          callback(false, errors['errors']);
        }
      }
    }
    EasyLoading.dismiss();
  }

  Future<void> register(BuildContext context,
      {required RegisterRequest request,
      required void Function(bool success, String error) callback}) async {
    EasyLoading.show();
    final ApiResponse apiResponse = await NetworkRepo().register(request);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      DataResponse<AuthData> loginResponse = DataResponse.fromJson(
          apiResponse.response!.data,
          (json) => AuthData.fromJson(json as Map<String, dynamic>));
      await PreferencesManager.save(loginResponse.data!.user!);
      await PreferencesManager.saveString(
          PreferencesManager.token, loginResponse.data!.token!);
      callback(true, '');
    } else {
      if (apiResponse.error is Map<String, dynamic>) {
        Map<String, dynamic> errors = apiResponse.error as Map<String, dynamic>;
        callback(false, errors['errors']);
      }
    }
    EasyLoading.dismiss();
  }
}
