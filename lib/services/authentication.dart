import 'package:budget_hub/api/clients/authentication.dart';
import 'package:budget_hub/api/responses/user.dart';

class AuthenticationService {
  final AuthenticationApi _authenticationApi = AuthenticationApi();

  Future<UserApiResponse> signIn(String username, String password) {
    return _authenticationApi.signIn(username, password);
  }
}