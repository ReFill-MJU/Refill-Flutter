import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static late String appUrl;

  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
    appUrl = dotenv.env['APP_URL'] ?? '';
  }
}
