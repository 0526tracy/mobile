import 'dart:async';

class Validator {
  final StreamTransformer<String, String> validateUsername = StreamTransformer<String, String>.fromHandlers(handleData: (String username, EventSink<String> sink) {
    if (username.isEmpty) {
      sink.addError('Enter your username');
    } else {
      sink.add(username);
    }
  });

  final StreamTransformer<String, String> validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (String password, EventSink<String> sink) {
    if (password.isEmpty) {
      sink.addError('Enter your password');
    } else {
      sink.add(password);
    }
  });

  final StreamTransformer<bool, bool> checkAuthentication = StreamTransformer<bool, bool>.fromHandlers(handleData: (bool auth, EventSink<bool> sink) {
    if (auth) {
      sink.add(true);
    } else {
      sink.add(false);
      sink.addError('Please login first');
    }
  });
}