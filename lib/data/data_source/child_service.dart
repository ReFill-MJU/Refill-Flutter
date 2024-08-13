import 'dart:convert';

import 'api_client.dart';

final ApiClient apiClient = ApiClient();

class ChildService {
  Future<String> childcareTest(int childId, String data) async {
    final url = '/childcare/$childId/test';

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
      print(utf8.decode(response.bodyBytes));
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
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('내 아이 추가 실패');
    }
  }

  Future<String> answerAdd(int childId, int answerNumber, String answer) async {
    final url = '/child/$childId/answer/$answerNumber';

    final body = jsonEncode(
      {
        'answer': answer,
      },
    );

    final response = await apiClient.patch(url, body: body);
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('질문 추가 실패');
    }
  }

  Future<String> myChildDetail(int childId) async {
    final url = '/child/$childId';

    final response = await apiClient.get(
      url,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('아이 상세 조회 실패');
    }
  }

  Future<String> summary(int childId) async {
    final url = '/childcare/$childId/summary';

    final response = await apiClient.get(
      url,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      throw Exception('아이 요약 조회 실패');
    }
  }
}
