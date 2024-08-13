import 'package:refill_app/data/data_source/child_service.dart';

class ChildRepository {
  static Future<String> childcareTest(int childId, String data) async {
    print(data);

    String? response = await ChildService().childcareTest(childId, data);
    print(response);
    return response;
  }

  static Future<String> childcareList() async {
    String? response = await ChildService().myChildList();
    return response;
  }

  static Future<String> childAdd(
      String name, String gender, String birth) async {
    String? response = await ChildService().childAdd(name, gender, birth);
    return response;
  }

  static Future<String> answerAdd(
      int childId, int answerNumber, String answer) async {
    String? response =
        await ChildService().answerAdd(childId, answerNumber, answer);
    print(response);
    return response;
  }

  static Future<String> myChildDetail(int childId) async {
    String? response = await ChildService().myChildDetail(childId);
    print(response);
    return response;
  }
}
