import 'package:flutter/material.dart';
import 'package:budget_hub/bloc/authentication.dart';
import 'package:budget_hub/bloc/provider/authentication.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppLogo(),
                  const SizedBox(height: 45.0),
                  SignInForm(),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      FlatButton(
                        padding: const EdgeInsets.all(0.0),
                        child: const Text(
                          'Sign up!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.0,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = AuthenticationBlocProvider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StreamBuilder<String>(
          stream: authenticationBloc.usernameStream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return TextField(
              decoration: _signInFormInputDecoration('Enter your Username', 'Username', Icons.person_outline),
              style: const TextStyle(
                color: Colors.white,
              ),
              onChanged: authenticationBloc.changeUsername,
            );
          }
        ),
        const SizedBox(height: 15.0),
        StreamBuilder<String>(
          stream: authenticationBloc.passwordStream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return TextField(
              decoration: _signInFormInputDecoration('Enter your Password', 'Password', Icons.lock_outline),
              style: const TextStyle(
                color: Colors.white,
              ),
              obscureText: true,
              onChanged: authenticationBloc.changePassword,
            );
          }
        ),
        const SizedBox(height: 5.0),
        FlatButton(
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: const Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
          },
        ),
        const SizedBox(height: 5.0),
        StreamBuilder<bool>(
          stream: authenticationBloc.submitValid,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return MaterialButton(
              color: Colors.white,
              elevation: 5.0,
              minWidth: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: Text(
                'Login'.toUpperCase(),
                textAlign: TextAlign.center,
              ),
              onPressed: snapshot.hasData ? authenticationBloc.signIn : null,
            );
          },
        ),
      ],
    );
  }

  InputDecoration _signInFormInputDecoration(String hintText, String labelText, IconData icon) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: Colors.white),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white70,
      ),
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      prefixIcon: Icon(icon, color: Colors.white)
    );
  }
}
