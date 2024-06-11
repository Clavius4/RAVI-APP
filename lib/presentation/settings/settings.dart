import 'package:flutter/material.dart';
import 'package:tax_advisory_app/core/app_export.dart';
import 'package:tax_advisory_app/presentation/login_screen/login_screen.dart';
import 'package:tax_advisory_app/sessions/session_manager.dart';
import '../../widgets/CustomSettingItem.dart';
import 'account_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0),
              end: const Alignment(0.5, 1),
              colors: [theme.colorScheme.primaryContainer, appTheme.gray100],
            ),
          ),
          child: Column(
            children: [
              _buildTaxAdvisorySystemStack(context),
              const SizedBox(height: 50),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    CustomSettingItem(
                      title: "Account",
                      icon: Icons.account_circle,
                      iconColor: Colors.blue, // Set icon color to blue
                      font: 'OpenSans', // Set font to OpenSans
                      borderColor: Colors.black12, // Set border color to blue
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccountScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 40), // Adjust space between items
                    CustomSettingItem(
                      title: "Notifications",
                      icon: Icons.notifications,
                      iconColor: Colors.blue, // Set icon color to blue
                      font: 'OpenSans', // Set font to OpenSans
                      borderColor: Colors.black12, // Set border color to blue
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => NotificationsScreen()),
                        // );
                      },
                    ),
                    const SizedBox(height: 40), // Adjust space between items
                    CustomSettingItem(
                      title: "Privacy and Security",
                      icon: Icons.lock,
                      iconColor: Colors.blue, // Set icon color to blue
                      font: 'OpenSans', // Set font to OpenSans
                      borderColor: Colors.black12, // Set border color to blue
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => PrivacySecurityScreen()),
                        // );
                      },
                    ),
                    const SizedBox(height: 40), // Adjust space between items
                    CustomSettingItem(
                      title: "Logout",
                      icon: Icons.logout,
                      iconColor: Colors.blue, // Set icon color to blue
                      font: 'OpenSans', // Set font to OpenSans
                      borderColor: Colors.black12, // Set border color to blue
                      onTap: () {
                        SessionManager.clearSession();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaxAdvisorySystemStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 337.v,
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage296x371,
              height: 296.v,
              width: 371.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 19.h,
                  bottom: 38.v,
                ),
                child: Text(
                  " Settings",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
