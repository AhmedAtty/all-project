import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smm_app/data/network_repo.dart';
import 'package:smm_app/models/info_page.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/models/responses/data_response.dart';
import 'package:smm_app/screens/auth_screen.dart';

class PagesProvider with ChangeNotifier {
  List<InfoPage> pages = [];

  Future<void> getPages(BuildContext context) async {
    if (pages.isEmpty) {
      EasyLoading.show();
      final ApiResponse apiResponse = await NetworkRepo().getPages();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        DataResponse<List<InfoPage>> pagesResponse = DataResponse.fromJson(
            apiResponse.response!.data,
            (json) => (json as List<dynamic>)
                .map((e) => InfoPage.fromJson(e))
                .toList());
        pages = pagesResponse.data!;
        log('Pages -> ${pages.map((e) => e.toJson()).toString()}');
      } else if (apiResponse.error != null) {
        if (apiResponse.error is Map<String, dynamic>) {
          Map<String, dynamic> errors =
              apiResponse.error as Map<String, dynamic>;
          if (errors['status_code'] == 401) {
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
