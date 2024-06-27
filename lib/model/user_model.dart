class User {
  final String token;

  User({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: '',
    );
  }
}
