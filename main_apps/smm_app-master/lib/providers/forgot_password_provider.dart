import 'package:flutter/material.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/responses/api_response.dart';

class ForgotPasswordProvider with ChangeNotifier {
  late String email;

  Future<void> resetPassword(BuildContext context,
      {required void Function(bool success, String message) callback,
      required GlobalKey<FormState> formKey}) async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      ApiResponse apiResponse =
          await NetworkRepo().forgetPassword(email: email);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        callback(
            true, 'Email sent successfully. Please check your spam box also!');
      } else {
        if (apiResponse.error is Map<String, dynamic>) {
          Map<String, dynamic> errors =
              apiResponse.error as Map<String, dynamic>;
          callback(false, errors['errors']);
        }
      }
    }
  }
}
