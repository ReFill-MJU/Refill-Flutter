import 'package:refill_app/data/data_source/child_service.dart';

class ChildRepository {
  static Future<String> childcareTest(String data) async {
    String? response = await ChildService().childcareTest(data);
    return response;
  }

  static Future<String> childcareList() async {
    String? response = await ChildService().myChildList();
    print(response);
    return response;
  }

  static Future<String> childAdd(
      String name, String gender, String birth) async {
    String? response = await ChildService().childAdd(name, gender, birth);
    return response;
  }
}
