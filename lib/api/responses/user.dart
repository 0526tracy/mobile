import 'package:budget_hub/models/user.dart';

class UserApiResponse {
  UserApiResponse({this.results, this.error});

  factory UserApiResponse.fromJson(Map<String, dynamic> json) {
    return UserApiResponse(
      results: (json['results']).map((dynamic result) => User.fromJson(result)).toList(),
      error: '',
    );
  }

  factory UserApiResponse.withErrors(String errorMessage) {
    return UserApiResponse(
      results: <User>[],
      error: errorMessage,
    );
  }

  final List<User> results;
  final String error;
}