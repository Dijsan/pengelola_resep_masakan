class User {
  final String username;
  final String password;
  bool isLoggedIn;

  User({
    required this.username,
    required this.password,
    this.isLoggedIn = false,
  });
}
