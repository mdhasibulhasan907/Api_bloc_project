import 'dart:convert';


import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;
  ApiClient._internal();

  //base Url
  final apiBaseurl = "https://jsonplaceholder.typicode.com";

  //get API method
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse("$apiBaseurl$endpoint"),
      headers: headers!,
    );
    return _progressResponse(response);
  }
}

//response status checking
dynamic _progressResponse(http.Response response) {
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to load data: ${response.statusCode}");
  }
}
