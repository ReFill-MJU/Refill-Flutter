import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/presentation/sign_in/sign_screen.dart';

import 'data/data_source/app_url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null);
  await dotenv.load(fileName: '.env');
  await AppUrl.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: RefillThemeColor.realWhite,
        colorScheme: const ColorScheme.light(
          primary: RefillThemeColor.black,
        ),
        fontFamily: 'Pretendard',
      ),
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
