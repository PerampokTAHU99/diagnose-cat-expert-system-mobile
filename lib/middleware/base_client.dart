import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClient {
  static const String apiUrl = "http://10.0.2.2:8000";

  final client = http.Client();

  Future<Map<String, dynamic>> get(
      String url,
      {
        Map<String, String> headers = const {}
      }
    ) async {
    Uri endpoint = Uri.parse(apiUrl + url);

    http.Response response = await client.get(
      endpoint,
      headers: {
        'Content-Type': "application/json",
        ...headers
      }
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> post(
      String url,
      {
        Map<String, String> headers = const {},
        Map<String, dynamic> body = const {}
      }
    ) async {
    Uri endpoint = Uri.parse(apiUrl + url);

    http.Response response = await client.post(
      endpoint,
      headers: {
        'Content-Type': "application/json",
        ...headers
      },
      body: jsonEncode(body),
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> put(
      String url,
      {
        Map<String, String> headers = const {},
        Map<String, dynamic> body = const {}
      }
    ) async {
    Uri endpoint = Uri.parse(apiUrl + url);

    http.Response response = await client.put(
      endpoint,
      headers: {
        'Content-Type': "application/json",
        ...headers
      },
      body: jsonEncode(body),
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> delete(
      String url,
      {
        Map<String, String> headers = const {},
        Map<String, dynamic> body = const {}
      }
    ) async {
    Uri endpoint = Uri.parse(apiUrl + url);

    http.Response response = await client.delete(
      endpoint,
      headers: {
        'Content-Type': "application/json",
        ...headers
      },
      body: jsonEncode(body),
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}