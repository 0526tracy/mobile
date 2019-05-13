import 'package:flutter/material.dart';

import 'package:budget_hub/services/authentication.dart';

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
                    children: const <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          'Sign Up!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: null,
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

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationService authenticationService =
        AuthenticationService(context: context, formKey: _formKey);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            decoration: _signInFormInputDecoration(
                'Enter your Username', 'Username', Icons.person_outline),
            style: const TextStyle(
              color: Colors.white,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your Username';
              }
            },
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            controller: passwordController,
            decoration: _signInFormInputDecoration(
                'Enter your Password', 'Password', Icons.lock_outline),
            style: const TextStyle(
              color: Colors.white,
            ),
            obscureText: true,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your Password';
              }
            },
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
            onPressed: () {},
          ),
          const SizedBox(height: 5.0),
          MaterialButton(
            color: Colors.white,
            elevation: 5.0,
            minWidth: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            child: Text(
              'Login'.toUpperCase(),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              authenticationService.signIn(
                  usernameController.text, passwordController.text);
            },
          ),
        ],
      ),
    );
  }

  InputDecoration _signInFormInputDecoration(
      String hintText, String labelText, IconData icon) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.red),
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
        prefixIcon: Icon(icon, color: Colors.white));
  }
}
