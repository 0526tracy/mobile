import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:budget_hub/models/authentication_response.dart';
import 'package:budget_hub/state/authentication.dart';
import 'package:budget_hub/utils/api.dart';

class AuthenticationService {
  AuthenticationService({this.context, this.formKey}) {
    authenticationState = Provider.of<AuthenticationState>(context);
  }

  final Api api = Api();
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  AuthenticationState authenticationState;

  Future<void> signIn(String username, String password) async {
    if (formKey.currentState.validate()) {
      final AuthenticationResponse authenticationResponse =
          await api.signIn(username, password);

      if (authenticationResponse.successful) {
        authenticationState.authenticated = true;
        authenticationState.authenticationToken =
            authenticationResponse.authenticationToken;
        authenticationState.user = authenticationResponse.user;
      } else {
        authenticationState.authenticated = false;
      }
    }
  }
}
