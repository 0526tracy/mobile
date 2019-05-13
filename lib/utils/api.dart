import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:budget_hub/models/authentication_response.dart';
import 'package:budget_hub/models/user.dart';

class Api {
  final String endpoint = 'http://127.0.0.1:4000/api';

  Future<AuthenticationResponse> signIn(
      String username, String password) async {
    try {
      final http.Response response = await http.post(
        '$endpoint/token',
        // ignore: always_specify_types
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        return AuthenticationResponse(
          successful: true,
          authenticationToken: response.headers['authorization']
              .replaceAll(RegExp(r'Bearer '), ''),
          user: User.fromJson(json.decode(response.body)),
        );
      } else {
        return AuthenticationResponse(
          successful: false,
          errorMessage: 'Username/Password combination is incorrect',
        );
      }
    } catch (error, stacktrace) {
      print('Exception occured: $error');
      print('Stacktrace: $stacktrace');

      return AuthenticationResponse(
        successful: false,
        errorMessage: '$error',
      );
    }
  }
}
