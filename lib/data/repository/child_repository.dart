import 'package:refill_app/data/data_source/child_service.dart';

class ChildRepository {
  static Future<String> childcareTest(String data) async {
    String? response = await ChildService().childcareTest(data);
    print(response);
    return response;
  }
}
