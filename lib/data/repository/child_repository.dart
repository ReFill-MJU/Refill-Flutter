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
}
