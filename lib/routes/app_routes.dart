import 'package:flutter/material.dart';
import 'package:tax_advisory_app/presentation/personal_info_screen/personal_info_screen.dart';
import '../core/app_export.dart';
import '../presentation/app_in_screen/app_in_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/language_screen/language_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/otp/otp_screen.dart';
import '../presentation/register_screen/register_screen.dart';
import '../presentation/register_success_screen/register_success_screen.dart';
import '../presentation/splash_screen/splash_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String languageScreen = '/language_screen';

  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';
  static const String homeScreen = '/home_screen';
  static const String otpScreen = '/otp_screen';
  static const String personal_infoScreen = '/personal_info_screen';

  static const String registerSuccessScreen = '/register_success_screen';

  static const String appInScreen = '/app_in_screen';

  static const String bottomNavScreen = '/app_in_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    languageScreen: (context) => LanguageScreen(),
    registerScreen: (context) => RegisterScreen(),
    loginScreen: (context) => LoginScreen(),
    homeScreen: (context) => HomeScreen(),
    otpScreen: (context) => OTPScreen(),
    registerSuccessScreen: (context) => RegisterSuccessScreen(),
    appInScreen: (context) => AppInScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => SplashScreen()
  };
}
