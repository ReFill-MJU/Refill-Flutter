import '../data_source/sign_in_service.dart';

class MemberRepository {
  static Future<String?> naverLogin(String accessToken) async {
    print(accessToken);
    String? response = await SignInApiService().naverSignIn(accessToken);

    return response;
  }
}
