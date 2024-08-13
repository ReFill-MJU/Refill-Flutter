import 'dart:convert';

import 'api_client.dart';

final ApiClient apiClient = ApiClient();

class ChildService {
  Future<String> childcareTest(String data) async {
    const url = '/childcare/test';

    final body = jsonEncode(
      {
        'data': data,
      },
    );

    final response = await apiClient.post(url, body: body);
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('보육 테스트 조회 실패');
    }
  }

  Future<String> myChildList() async {
    const url = '/child';

    final response = await apiClient.get(url);
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('내 아이 리스트 조회 실패');
    }
  }

  Future<String> childAdd(String name, String gender, String birth) async {
    const url = '/child';

    final body = jsonEncode(
      {
        'name': name,
        'gender': gender,
        'birth': birth,
      },
    );

    final response = await apiClient.post(url, body: body);
    if (response.statusCode == 200) {
      print(utf8.decode(response.bodyBytes));
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('내 아이 추가 실패');
    }
  }
}
