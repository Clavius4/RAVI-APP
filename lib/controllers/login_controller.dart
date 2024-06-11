// // controllers/auth_controller.dart
// import 'package:flutter/material.dart';
//
// import '../models/auth_response.dart';
// import '../models/user.dart';
// import '../services/login_service.dart';
//
//
// class LoginController extends ChangeNotifier {
//   final LoginService _authService = LoginService();
//   bool _isLoading = false;
//   LoginService? _authResponse;
//
//   bool get isLoading => _isLoading;
//   LoginService? get authResponse => _authResponse;
//
//   Future<bool> login(String phoneNumber, String password) async {
//     _isLoading = true;
//     notifyListeners();
//
//     User user = User(phoneNumber: phoneNumber, password: password);
//     AuthResponse? response = await _authService.login(user);
//
//     _isLoading = false;
//     notifyListeners();
//
//     if (response != null) {
//       _authResponse = response as LoginService?;
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
