import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/requests/support_request.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/screens/auth_screen.dart';

class SupportProvider with ChangeNotifier {
  late String name;
  late String phone;
  late String email;
  late String message;

  Future<void> sendMessage(BuildContext context,
      {required GlobalKey<FormState> formKey,
      required void Function(bool success, String error) callback}) async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      SupportRequest request = SupportRequest(
        name: name,
        phone: phone,
        email: email,
        message: message,
      );
      await sendSupportMessage(context, request: request, callback: callback);
    }
  }

  Future<void> sendSupportMessage(BuildContext context,
      {required SupportRequest request,
      required void Function(bool success, String error) callback}) async {
    EasyLoading.show();
    final ApiResponse apiResponse =
        await NetworkRepo().sendSupportRequest(request);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
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
  }
}
