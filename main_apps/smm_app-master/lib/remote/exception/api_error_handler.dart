import 'package:dio/dio.dart';
import 'package:smm_app/models/responses/error_response.dart';
import 'package:smm_app/models/responses/validation_error.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = {};
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 404:
                case 500:
                case 503:
                  // errorDescription = error.response!.statusMessage;
                  errorDescription = {
                    'status_code': error.response!.statusCode!,
                    'errors': error.response!.statusMessage!
                  };
                  break;
                case 400:
                case 403:
                  ErrorResponse errorResponse =
                      ErrorResponse.fromJson(error.response!.data);
                  // errorDescription = errorResponse.errors!;
                  errorDescription = {
                    'status_code': error.response!.statusCode!,
                    'errors': errorResponse.error!
                  };
                  break;
                case 401:
                  ErrorResponse errorResponse =
                      ErrorResponse.fromJson(error.response!.data);
                  // errorDescription = errorResponse.errors!;
                  errorDescription = {
                    'status_code': error.response!.statusCode!,
                    'errors': errorResponse.error!
                  };
                  break;
                case 422:
                  ValidationError validationError =
                      ValidationError.fromJson(error.response!.data);
                  // errorDescription = _getErrors(validationError);
                  errorDescription = {
                    'status_code': error.response!.statusCode!,
                    'errors': validationError.message!
                  };
                  break;
                default:
                  ErrorResponse errorResponse =
                      ErrorResponse.fromJson(error.response!.data);
                  if (errorResponse.error != null &&
                      errorResponse.error!.isNotEmpty) {
                    // errorDescription = errorResponse;
                    errorDescription = {
                      'status_code': error.response!.statusCode!,
                      'errors': errorResponse
                    };
                  } else {
                    // errorDescription =
                    //     "Failed to load data - status code: ${error.response!.statusCode}";
                    errorDescription = {
                      'status_code': error.response!.statusCode!,
                      'errors':
                          'Failed to load data - status code: ${error.response!.statusCode}'
                    };
                  }
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
