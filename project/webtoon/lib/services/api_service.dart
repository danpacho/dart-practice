import 'package:http/http.dart' as http;
import 'package:webtoon/services/api_response.dart';

class ApiService {
  final String baseUrl;
  final ApiResponse apiResponse = ApiResponse();
  ApiService({
    required this.baseUrl,
  });

  String _addRoutePath(dynamic endPoint) {
    switch (endPoint.runtimeType) {
      case String:
        return "/$endPoint";
      case List<String>:
        return (endPoint as List<String>).fold(
          "",
          (acc, curr) => "$acc/$curr",
        );
      default:
        return endPoint;
    }
  }

  Future<dynamic> fetch<T>({
    T? endpoint,
  }) async {
    final Uri parsedUri =
        Uri.parse('$baseUrl${endpoint != null ? _addRoutePath(endpoint) : ''}');
    try {
      apiResponse.handleResponse(
        response: await http.get(parsedUri),
      );

      return apiResponse.data;
    } catch (e) {
      print("ERROR in api_service $e");
      throw Error();
    }
  }
}
