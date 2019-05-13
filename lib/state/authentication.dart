import 'package:flutter/foundation.dart';

import 'package:budget_hub/models/user.dart';

class AuthenticationState with ChangeNotifier {
  bool _authenticated = false;
  String _authenticationToken = '';
  User _user = User(username: '');

  bool get authenticated => _authenticated;
  String get authenticationToken => _authenticationToken;
  User get user => _user;

  set authenticated(bool newValue) {
    _authenticated = newValue;
    notifyListeners();
  }

  set authenticationToken(String newValue) {
    _authenticationToken = newValue;
    notifyListeners();
  }

  set user(User newValue) {
    _user = newValue;
    notifyListeners();
  }
}
