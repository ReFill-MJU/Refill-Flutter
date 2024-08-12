import 'dart:convert';

import 'api_client.dart';

final ApiClient apiClient = ApiClient();

class ChildService {
  Future<String> childcareTest(String data) async {
    const url = '/childcare/test';

    final body = jsonEncode({
      'data': data,
    });

    final response = await apiClient.post(url, body: body);

    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('보육 테스트 조회 실패');
    }
  }
}
