import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:refill_app/core/app_bar/primary_app_bar.dart';
import 'package:refill_app/core/theme/refill_theme_color.dart';
import 'package:refill_app/core/theme/refill_theme_text_style.dart';
import 'package:refill_app/presentation/home/home_screen.dart';

import '../../data/repository/member_repository.dart';
import 'view/sign_button.dart';

const storage = FlutterSecureStorage();
final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSignIn = false;
  String? accessToken;
  String? expiresAt;
  String? tokenType;
  String? name;
  String? profileImage;
  String? refreshToken;

  void _showSnackError(String error) {
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error.toString()),
      ),
    );
  }

  _asyncMethod() async {
    if (await storage.read(key: "accessToken") != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // _asyncMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 184.0),
                  SvgPicture.asset('assets/image/app_icon.svg'),
                  const SizedBox(height: 16.0),
                  Text(
                    '우리 아이와 어디서나 함께하는\n맞춤형 ai 서비스',
                    style: RefillThemeTextStyle.body6
                        .copyWith(color: RefillThemeColor.gray40),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SignInButton(
              onPressed: () {
                buttonLoginPressed();
              },
              svgPicture: SvgPicture.asset(
                'assets/icon/ic_naver.svg',
                width: 36,
                height: 36,
                colorFilter: const ColorFilter.mode(
                    RefillThemeColor.realWhite, BlendMode.srcIn),
              ),
              text: '네이버로 로그인하기',
            ),
            const SizedBox(
              height: 24.0,
            )
          ],
        ),
      ),
    );
  }

  Future<void> buttonLoginPressed() async {
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();
      await storage.write(key: 'name', value: res.account.nickname);
      await storage.write(key: 'profileImage', value: res.account.profileImage);
      setState(() {
        name = res.account.nickname;
        isSignIn = true;
        buttonTokenPressed(res.account.nickname, res.account.profileImage);
      });
    } catch (error) {
      _showSnackError(error.toString());
    }
  }

  Future<void> buttonTokenPressed(String name, String? profileImage) async {
    try {
      final NaverAccessToken res = await FlutterNaverLogin.currentAccessToken;
      setState(() {
        refreshToken = res.refreshToken;
        accessToken = res.accessToken;
        tokenType = res.tokenType;
      });
      await MemberRepository.naverLogin(res.accessToken);
      if (await storage.read(key: "accessToken") != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      }
    } catch (error) {
      _showSnackError(error.toString());
    }
  }
}
