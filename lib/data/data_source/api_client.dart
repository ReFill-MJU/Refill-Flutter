import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'app_url.dart';

const storage = FlutterSecureStorage();

class ApiClient {
  final String baseUrl = 'http://${AppUrl.appUrl}';
  late http.Client client;

  ApiClient() {
    client = http.Client();
  }

  Future<Map<String, String>> _getHeaders() async {
    String? accessToken = await storage.read(key: "accessToken");
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    if (accessToken != null) {
      headers["Authorization"] = "Bearer $accessToken";
    }
    return headers;
  }

  Future<http.Response> _sendRequest(String method, String endpoint,
      {Map<String, String>? headers, Object? body, File? file}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final tokenHeaders = await _getHeaders();

    headers = headers == null ? tokenHeaders : {...headers, ...tokenHeaders};

    http.Response response;
    switch (method) {
      case 'GET':
        response = await client.get(url, headers: headers);
        break;
      case 'POST':
        response = await client.post(url, headers: headers, body: body);
        break;
      case 'PATCH':
        response = await client.patch(url, headers: headers, body: body);
        break;
      case 'DELETE':
        response = await client.delete(url, headers: headers, body: body);
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to perform $method request to $endpoint');
    }
  }

  Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    return _sendRequest('GET', endpoint, headers: headers);
  }

  Future<http.Response> post(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    return _sendRequest('POST', endpoint, headers: headers, body: body);
  }

  Future<http.Response> patch(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    return _sendRequest('PATCH', endpoint, headers: headers, body: body);
  }

  Future<http.Response> delete(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    return _sendRequest('DELETE', endpoint, headers: headers, body: body);
  }
}
