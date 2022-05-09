import 'package:dio/dio.dart';

import 'ApiResponse.dart';

class BaseResponse {
  Map<String, dynamic>? result;

  BaseResponse({
    this.result,
  });

  factory BaseResponse.fromJson(json) => BaseResponse(
        result: json,
      );

  static ApiResponse extractResponse(Response<dynamic>? httpResponse) {
    final BaseResponse baseResponse = BaseResponse.fromJson(httpResponse?.data);
    //مؤقت علشان ميدخلش هنا
    if (1 == 5) {
      // api send error to webservice caller.
      final StringBuffer apiError = StringBuffer();
      final errors = baseResponse.result?['errors'] as List<dynamic>;
      for (var element in errors) {
        apiError.write(element['msg']);
        apiError.write("\n");
      }

      return ApiResponse(
          statusCode: httpResponse?.statusCode,
          isSuccess: false,
          message: apiError.toString());
    } else {
      // server response data from webservice call.
      return ApiResponse(
          statusCode: httpResponse?.statusCode,
          data: baseResponse.result,
          isSuccess: true);
    }
  }
}
