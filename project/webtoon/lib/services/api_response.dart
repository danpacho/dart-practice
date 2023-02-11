import 'dart:convert';

import 'package:http/http.dart';

enum ResponseStatus {
  success,
  clientError,
  serverError,
  unknownError,
  redirection,
  pending,
}

class ApiResponse {
  ResponseStatus status = ResponseStatus.pending;
  dynamic data;
  int? statusCode;

  dynamic _transformResponseToJson(String jsonString) => jsonDecode(jsonString);

  int _getResponseCodeNumber({
    required int number,
  }) =>
      int.parse("$number".split("")[0]);

  void handleResponse({
    required Response response,
  }) {
    statusCode = response.statusCode;
    final statusCodeInitialNumber =
        _getResponseCodeNumber(number: response.statusCode);

    switch (statusCodeInitialNumber) {
      case 1:
        status = ResponseStatus.pending;
        break;
      case 2:
        status = ResponseStatus.success;
        data = _transformResponseToJson(
          response.body,
        );
        break;
      case 3:
        data = null;
        status = ResponseStatus.redirection;
        break;
      case 4:
        data = null;
        status = ResponseStatus.clientError;
        break;
      case 5:
        data = null;
        status = ResponseStatus.serverError;
        break;
      default:
        data = null;
        status = ResponseStatus.unknownError;
        break;
    }
  }
}
