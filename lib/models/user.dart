class User {
  final String userId;
  final String email;
  final String username;
  final String phone;
  final String password;

  User(this.userId, this.email, this.username, this.phone, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['user_id'] as String,
      json['email'] as String,
      json['username'] as String,
      json['phone'] as String,
      "password",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'username': username,
      'phone': phone
    };
  }
}
