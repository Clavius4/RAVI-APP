// lib/models/user_model.dart

class UserModel {
  String phoneNumber;
  String password;
  String firstName;
  String lastName;
  String region;
  String district;
  String organisationType;
  String organisationName;

  UserModel({
    required this.phoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.region,
    required this.district,
    required this.organisationType,
    required this.organisationName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    region: json["region"],
    district: json["district"],
    organisationType: json["organisationType"],
    organisationName: json["organisationName"],
  );

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'region': region,
      'district': district,
      'organisationType': organisationType,
      'organisationName': organisationName,
    };
  }
}
