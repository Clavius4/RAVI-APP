// sessions/session_manager.dart
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_response.dart';

class SessionManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenTypeKey = 'token_type';
  static const String _expiresInKey = 'expires_in';
  static const String _scopeKey = 'scope';


  static void saveAccessToken(String atk) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString(_accessTokenKey, atk);
}

static void saveLoggedIn(bool loginValue) async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool("login", loginValue);
}

static Future<bool> getLoggedInUser() async{
    final preference = await SharedPreferences.getInstance();
    return preference.getBool("login")?? false;
}

static void removeLoggedIn() async{
    final preference = await SharedPreferences.getInstance();
    preference.setBool("login", false);
}

static Future<String> getAccessToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString(_accessTokenKey)?? "";
  }

  static Future<void> saveSession(AuthResponse authResponse) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, authResponse.accessToken);
    await prefs.setString(_refreshTokenKey, authResponse.refreshToken);
    await prefs.setString(_tokenTypeKey, authResponse.tokenType);
    await prefs.setInt(_expiresInKey, authResponse.expiresIn);
    await prefs.setString(_scopeKey, authResponse.scope);
  }

  static Future<AuthResponse?> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_accessTokenKey);
    final refreshToken = prefs.getString(_refreshTokenKey);
    final tokenType = prefs.getString(_tokenTypeKey);
    final expiresIn = prefs.getInt(_expiresInKey);
    final scope = prefs.getString(_scopeKey);

    if (accessToken != null && refreshToken != null && tokenType != null && expiresIn != null && scope != null) {
      return AuthResponse(
        accessToken: accessToken,
        tokenType: tokenType,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
        scope: scope,
      );
    } else {
      return null;
    }
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_tokenTypeKey);
    await prefs.remove(_expiresInKey);
    await prefs.remove(_scopeKey);

    prefs.setBool("login", false);
  }
}
