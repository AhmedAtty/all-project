import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sex_smart/helper/response_model.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class Header {
  static Map<String, String> get userAuth => {
        'Content-Type': 'application/json',
      };

  static Map<String, String> get noAuth => {'Content-Type': 'application/json'};
}

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fuodz.edentech.online/api/',
        receiveDataWhenStatusError: true,
        validateStatus: (i) => true,
        responseType: ResponseType.plain,
      ),
    );

    dio.interceptors.add(CustomInterceptors());
  }

  static Future<ResponseModel> getData({
    required String url,
    Map<String, dynamic>? query,
  }) {
    return _request(url: url, requesType: RequestType.get, query: query);
  }

  static Future<ResponseModel> postData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
  }) {
    return _request(
      url: url,
      requesType: RequestType.post,
      query: query,
      data: data,
    );
  }

  static Future<ResponseModel> _request({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    RequestType requesType = RequestType.get,
  }) async {
    Response? response;
    try {
      switch (requesType) {
        case RequestType.post:
          response = await dio.post(
            url,
            queryParameters: query,
            data: json.encode(data),
            options: Options(
                headers: Header.userAuth, responseType: ResponseType.plain),
          );
          break;

        case RequestType.put:
          response = await dio.put(
            url,
            queryParameters: query,
            data: json.encode(data),
            options: Options(
              headers: Header.userAuth,
            ),
          );
          break;

        case RequestType.delete:
          response = await dio.delete(
            url,
            queryParameters: query,
            options: Options(
              headers: Header.userAuth,
            ),
          );
          break;

        case RequestType.get:
        default:
          response = await dio.get(
            url,
            queryParameters: query,
            options: Options(
              headers: Header.userAuth,
            ),
          );
          break;
      }

      if (response.statusCode == 200) {
        return ResponseModel(
          statusCode: response.statusCode!,
          data: response.data,
          success: true,
        );
      } else {
        return ResponseModel(
          statusCode: response.statusCode ?? 400,
          success: false,
        );
      }
    } catch (e) {
      return ResponseModel(
        statusCode: response?.statusCode ?? 500,
        success: false,
      );
    }
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST:: ${options.uri} and Body::${options.data}');
    log('Header:: ${options.headers}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE:: Status code is: ${response.statusCode} response is: ${response.data}');

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR::$err');
    return handler.next(err);
  }
}
