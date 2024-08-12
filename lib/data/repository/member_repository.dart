import '../data_source/sign_in_service.dart';

class MemberRepository {
  static Future<String?> naverLogin(String accessToken) async {
    String? response = await SignInService().naverSignIn(accessToken);

    return response;
  }
}
