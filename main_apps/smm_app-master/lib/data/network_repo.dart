import 'package:dio/dio.dart';
import 'package:smm_app/models/requests/login_request.dart';
import 'package:smm_app/models/requests/register_request.dart';
import 'package:smm_app/models/requests/support_request.dart';
import 'package:smm_app/models/requests/update_profile_request.dart';
import 'package:smm_app/models/responses/api_response.dart';
import 'package:smm_app/remote/dio/api_client.dart';
import 'package:smm_app/remote/exception/api_error_handler.dart';
import 'package:smm_app/utils/app_constants.dart';

class NetworkRepo {
  Future<ApiResponse> register(RegisterRequest request) async {
    try {
      Response response = await ApiClient().post(
        AppConstants.registerPath,
        data: request.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> login(LoginRequest request) async {
    try {
      Response response = await ApiClient().post(
        AppConstants.loginPath,
        data: request.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> sendSupportRequest(SupportRequest request) async {
    try {
      Response response = await ApiClient().post(
        AppConstants.supportPath,
        data: request.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCategories() async {
    try {
      Response response = await ApiClient().get(
        AppConstants.categoriesPath,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getPages() async {
    try {
      Response response = await ApiClient().get(
        AppConstants.pagesPath,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOffers() async {
    try {
      Response response = await ApiClient().get(
        AppConstants.offersPath,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOrders() async {
    try {
      Response response = await ApiClient().get(
        AppConstants.ordersPath,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getUserProfile() async {
    try {
      Response response = await ApiClient().get(
        AppConstants.profilePath,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> forgetPassword({required String email}) async {
    try {
      Response response = await ApiClient()
          .post(AppConstants.forgetPasswordPath, data: {'email': email});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateUserProfile(UpdateProfileRequest request) async {
    try {
      Response response = await ApiClient()
          .put(AppConstants.updateProfilePath, data: request.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCategoryServices(int categoryId) async {
    try {
      Response response = await ApiClient().get(
        '${AppConstants.categoriesPath}/$categoryId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getServiceById(int serviceId) async {
    try {
      Response response = await ApiClient().get(
        '${AppConstants.servicesPath}/$serviceId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOfferById(int offerId) async {
    try {
      Response response = await ApiClient().get(
        '${AppConstants.offersPath}/$offerId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
