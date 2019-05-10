import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:budget_hub/api/responses/user.dart';

class AuthenticationApi {
  final String endpoint = 'http://127.0.0.1:4000/api/users';

  Future<UserApiResponse> signIn(String username, String password) async {
    try {
      final http.Response response = await http.post(
        endpoint,
        body: {
          username: username,
          password: password,
        },
      );

      return UserApiResponse.fromJson(json.decode(response.body));
    } catch (error, stacktrace) {
      print('Exception occured: $error');
      print('Stacktrace: $stacktrace');
      return UserApiResponse.withErrors('$error');
    }
  }
}