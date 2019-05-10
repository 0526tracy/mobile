class User {
  User({this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
    );
  }

  final String username;
}