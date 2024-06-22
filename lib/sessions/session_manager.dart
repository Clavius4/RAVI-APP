// sessions/session_manager.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_response.dart';

class SessionManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenTypeKey = 'token_type';
  static const String _expiresInKey = 'expires_in';
  static const String _scopeKey = 'scope';
  static const String _phoneNumberKey = 'phoneNumber';
  static const String _firstNameKey = 'firstName';
  static const String _lastNameKey = 'lastName';
  static const String _organisationNameKey = 'organisationName';
  static const String _organisationTypeKey = 'organisationType';
  static const String _regionKey = 'region';
  static const String _districtKey = 'district';

  static Future<void> saveAccessToken(String atk) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, atk);
  }

  static Future<void> saveLoggedIn(bool loginValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", loginValue);
  }

  static Future<void> saveFirstName(String firstname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_firstNameKey, firstname);
  }

  static Future<void> saveLastName(String lastname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastNameKey, lastname);
  }

  static Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_phoneNumberKey, phone);
  }

  static Future<void> saveOrganizationName(String orgName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_organisationNameKey, orgName);
  }

  static Future<void> saveOrganizationType(String orgType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_organisationTypeKey, orgType);
  }

  static Future<void> saveRegion(String region) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_regionKey, region);
  }

  static Future<void> saveDistrict(String district) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_districtKey, district);
  }

  static Future<bool> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("login") ?? false;
  }

  static Future<void> removeLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", false);
  }

  static Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey) ?? "";
  }

  static Future<String> getFirstname() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_firstNameKey) ?? "";
  }

  static Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_phoneNumberKey) ?? "";
  }

  static Future<String> getLastName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastNameKey) ?? "";
  }
  static Future<String> getDistrict() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_districtKey) ?? "";
  }
  static Future<String> getRegion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_regionKey) ?? "";
  }
  static Future<String> getOrganisationName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_organisationNameKey) ?? "";
  }
  static Future<String> getOrganisationType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_organisationTypeKey) ?? "";
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_tokenTypeKey);
    await prefs.remove(_expiresInKey);
    await prefs.remove(_scopeKey);
    await prefs.remove(_phoneNumberKey);
    await prefs.remove(_firstNameKey);
    await prefs.remove(_lastNameKey);
    await prefs.remove(_organisationNameKey);
    await prefs.remove(_organisationTypeKey);
    await prefs.remove(_districtKey);
    await prefs.remove(_regionKey);

    await prefs.setBool("login", false);
  }
}
