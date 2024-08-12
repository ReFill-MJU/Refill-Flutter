import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'api_client.dart';

const storage = FlutterSecureStorage();
final ApiClient apiClient = ApiClient();

class SignInApiService {
  Future<String?> naverSignIn(String accessToken) async {
    try {
      var url = Uri.http(
        '${dotenv.env['APP_URL']}',
        '/login',
      );
      final body = jsonEncode({
        'accessToken': accessToken,
      });

      var response = await http.post(
        url,
        headers: {
          'Content-type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        var data = utf8.decode(response.bodyBytes);
        await storage.write(
            key: "accessToken", value: data);
        return data;
      } else {
        throw Exception('네이버 로그인 실패');
      }
    } catch (error) {
      return null;
    }
    return null;
  }
}
