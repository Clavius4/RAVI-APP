// models/auth_response.dart
class AuthResponse {
  final String accessToken;
  final String tokenType;
  final String refreshToken;
  final int expiresIn;
  final String scope;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String organisationName;
  final String organisationType;
  final String district;
  final String region;

  AuthResponse({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.expiresIn,
    required this.scope,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.organisationName,
    required this.organisationType,
    required this.district,
    required this.region,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      scope: json['scope'],
      phoneNumber: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      organisationName: json['organisationName'],
      organisationType: json['organisationType'],
      district: json['district'],
      region: json['region'],
    );
  }
}
