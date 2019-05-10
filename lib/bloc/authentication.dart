import 'dart:async';
import 'package:rxdart/rxdart.dart';
// import 'package:budget_hub/services/authentication.dart';
// import 'package:budget_hub/api/responses/user.dart';
import 'package:budget_hub/models/validator.dart';

class AuthenticationBloc extends Validator {
  // final AuthenticationService _authenticationService = AuthenticationService();
  // final BehaviorSubject<UserApiResponse> _subject = BehaviorSubject<UserApiResponse>();

  final BehaviorSubject<String> _usernameController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  final BehaviorSubject<String> _tokenController = BehaviorSubject<String>();
  final BehaviorSubject<bool> _authenticatedController = BehaviorSubject<bool>();

  // void signIn() async {
  //   final UserApiResponse response = await _authenticationService.signIn(_username.stream, _password.stream);
  //   _subject.sink.add(response);
  // }

  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get usernameStream => _usernameController.stream.transform(validateUsername);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);
  Stream<bool> get isAuthenticated => _authenticatedController.stream.transform(checkAuthentication);
  Stream<String> get storedToken => _tokenController.stream;
  Stream<bool> get submitValid => Observable.combineLatest2(usernameStream, passwordStream, (String username, String password) => true);

  void signIn() {
    final String validUsername = _usernameController.value;
    final String validPassword = _passwordController.value;

    if (validUsername != '' && validPassword != '') {
      _authenticatedController.sink.add(true);
      _tokenController.sink.add('Bearer asdfghhjkl');
    }
  }

  void dispose() {
    // _subject.close();
    _usernameController.close();
    _passwordController.close();
  }

  // BehaviorSubject<UserApiResponse> get subject => _subject;
}