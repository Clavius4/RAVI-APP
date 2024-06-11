// models/user.dart
class User {
  final String phoneNumber;
  final String password;

  User({required this.phoneNumber, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }
}
