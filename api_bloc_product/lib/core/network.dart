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

  //get API by id  method
  Future<dynamic> getBtId(
    String endpoint,
    var id, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse("$apiBaseurl$endpoint/$id"),
      headers: headers!,
    );
    return _progressResponse(response);
  }

  // POST API method
  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse("$apiBaseurl$endpoint"),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(data), // data কে JSON format এ রূপান্তর করা হচ্ছে
    );
    return _progressResponse(response);
  }

  // delet product by id
  Future<dynamic> deletById(
    String endpoint,
    var id, {
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(
      Uri.parse("$apiBaseurl$endpoint/$id"),
      headers: headers!,
    );
    return _progressResponse(response);
  }

  // patch API by id method
  Future<dynamic> patchById(
    String endpoint,
    var id,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    final response = await http.patch(
      Uri.parse("$apiBaseurl$endpoint/$id"),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _progressResponse(response);
  }

  // put API by id method
  Future<dynamic> putById(
    String endpoint,
    var id,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      Uri.parse("$apiBaseurl$endpoint/$id"),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(data),
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
