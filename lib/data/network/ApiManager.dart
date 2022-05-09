import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../main.dart';
import '../../utilities/navigation_util.dart';
import '../../utilities/toast_util.dart';
import '../cache/AppCache.dart';
import 'ApiResponse.dart';
import 'BaseResponse.dart';
import 'RequestBody.dart';

class ApiManager {
  static final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiManager.getBaseUrl(),
      connectTimeout: 30000,
      sendTimeout: 3000,
      receiveTimeout: 30000));
  static const bool _isTestMode = true;

  static void init() {
    if (_isTestMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        responseHeader: false,
      ));
    }
  }

  static Future<ApiResponse> sendRequest({
    required String link,
    RequestBody? body,
    Map<String, dynamic>? queryParams,
    FormData? formData,
    Map<String, dynamic>? headers,
    Method method = Method.POST,
  }) async {
    // add user token if user registered in app.
    // headers ??= {"content-type": "application/json"};
    // final UserModel? user = AppCache.getUser();
    // if (user != null) {
    //   headers.putIfAbsent("Authorization", () => 'Bearer token');
    // }
    try {
      Response? response;
      if (method == Method.POST) {
        response = await _dio.post(
          link,
          data: formData ?? body?.getBody(),
          queryParameters: queryParams,
          options: Options(headers: headers),
        );
      } else if (method == Method.PUT) {
        response = await _dio.put(link,
            data: formData ?? body?.getBody(),
            queryParameters: queryParams,
            options: Options(headers: headers));
      } else if (method == Method.GET) {
        response = await _dio.get(
          link,
          queryParameters: queryParams,
          options: Options(headers: headers),
        );
      } else if (method == Method.DELETE) {
        response = await _dio.delete(link,
            data: body,
            queryParameters: queryParams,
            options: Options(headers: headers));
      } else if (method == Method.PATCH) {
        response = await _dio.patch(link,
            data: formData ?? body?.getBody(),
            queryParameters: queryParams,
            options: Options(headers: headers));
      }

      return BaseResponse.extractResponse(response);
    } on DioError catch (e) {
      if (e.response != null && e.response?.statusCode == 401) {
        ToastUtil.showLongToast(message: "message.user_unauthorized".tr());
        AppCache.clearCache();
        NavigateUtil.navigate(
            navigatorKey.currentContext!, const MyApp(), true);
        return ApiResponse(
            statusCode: e.response?.statusCode, isSuccess: false, message: "");
      } else if (e.response != null && e.response?.statusCode == 400) {
        return BaseResponse.extractResponse(e.response);
      } else {
        return ApiResponse(
            statusCode: e.response?.statusCode,
            isSuccess: false,
            message: "Error in connection");
      }
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponse(
          statusCode: -1, isSuccess: false, message: "Error in connection");
    }
  }

  static String getBaseUrl() {
    if (_isTestMode) {
      return "https://6278aa73d00bded55adc5999.mockapi.io/api/";
    } else {
      return "https://6278aa73d00bded55adc5999.mockapi.io/api/";
    }
  }

  static String buildFileUrl(String filePatUrl) {
    return getBaseUrl() + filePatUrl;
  }
}

enum Method { POST, PUT, GET, DELETE, PATCH }
