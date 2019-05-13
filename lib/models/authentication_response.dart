import 'package:budget_hub/models/user.dart';

class AuthenticationResponse {
  AuthenticationResponse(
      {this.successful,
      this.user,
      this.authenticationToken,
      this.errorMessage});

  final bool successful;
  final User user;
  final String authenticationToken;
  final String errorMessage;
}
