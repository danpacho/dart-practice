import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({
    required this.baseUrl,
  });

  Future<List<dynamic>?> fetch({
    String? endpoint,
  }) async {
    final Uri parsedUri =
        Uri.parse('$baseUrl${endpoint != null ? '/$endpoint' : ''}');

    try {
      final response = await http.get(parsedUri);
      if (response.statusCode == 200) {
        final List<dynamic> res = jsonDecode(response.body);
        return res;
      }
      return Future(() => null);
    } catch (e) {
      print(e); // throw ErrorDescription(e.toString());
      return Future(() => null);
    }
  }
}
