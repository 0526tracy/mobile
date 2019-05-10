import 'package:flutter/material.dart';
import 'package:budget_hub/bloc/authentication.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  AuthenticationBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  final AuthenticationBloc authenticationBloc = AuthenticationBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthenticationBloc of(BuildContext context) {
    // ignore: avoid_as
    return (context.inheritFromWidgetOfExactType(AuthenticationBlocProvider) as AuthenticationBlocProvider).authenticationBloc;
  }
}