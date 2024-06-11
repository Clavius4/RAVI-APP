import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:tax_advisory_app/presentation/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:tax_advisory_app/presentation/splash_screen/splash_screen.dart';
import 'package:tax_advisory_app/sessions/session_manager.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ThemeHelper().changeTheme('primary');
  bool loggedIn = await SessionManager.getLoggedInUser();

  runApp(MyApp(isLoggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  MyApp({required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        print(isLoggedIn);
        return MaterialApp(
          theme: theme,
          title: 'tax_advisory_app',
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? BottomNavScreen() : SplashScreen(),
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
