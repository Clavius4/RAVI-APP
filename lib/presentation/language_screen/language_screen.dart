import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../login_screen/login_screen.dart';
import '../register_screen/register_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool _isSwahiliSelected = true;  // Initially set Swahili as selected
  bool _isEnglishSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                theme.colorScheme.primaryContainer,
                appTheme.gray100,
              ],
            ),
          ),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 761.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        _buildTaxAdvisorStack(context),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.h,
                              vertical: 42.v,
                            ),
                            decoration: AppDecoration.fillBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL38,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 3.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.h),
                                  child: Text(
                                    "Chagua Lugha",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                SizedBox(height: 48.v),
                                CustomOutlinedButton(
                                  text: "Swahili",
                                  rightIcon: _isSwahiliSelected
                                      ? Transform.translate(
                                    offset: Offset(100.h, 0),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgTick,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                    ),
                                  )
                                      : null,
                                  textStyle: CustomTextStyles.titleMediumGray50.copyWith(
                                    color: _isSwahiliSelected ? Colors.white : theme.colorScheme.onPrimary,
                                  ),
                                  borderColor: _isSwahiliSelected ? Colors.blueAccent : theme.colorScheme.primary.withOpacity(0.5),
                                  backgroundColor: _isSwahiliSelected ? Colors.blueAccent : Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      _isSwahiliSelected = true;
                                      _isEnglishSelected = false;
                                    });
                                  },
                                ),
                                SizedBox(height: 24.v),
                                CustomOutlinedButton(
                                  text: "English",
                                  rightIcon: _isEnglishSelected
                                      ? Transform.translate(
                                    offset: Offset(100.h, 0),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgTick,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                    ),
                                  )
                                      : null,
                                  textStyle: CustomTextStyles.titleMediumGray50.copyWith(
                                    color: _isEnglishSelected ? Colors.white : theme.colorScheme.onPrimary,
                                  ),
                                  borderColor: _isEnglishSelected ? Colors.blueAccent : theme.colorScheme.primary.withOpacity(0.5),
                                  backgroundColor: _isEnglishSelected ? Colors.blueAccent : Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      _isSwahiliSelected = false;
                                      _isEnglishSelected = true;
                                    });
                                  },
                                ),
                                SizedBox(height: 100.v),
                                CustomElevatedButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                          (route) => false,
                                    );
                                  },
                                  text: "Endelea",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 86.v,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondaryContainer,
                          spreadRadius: 2.h,
                          blurRadius: 2.h,
                          offset: Offset(
                            0,
                            -8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectLanguage(String language) {
    setState(() {
      // Your code to handle language selection
    });
  }

  /// Section Widget
  Widget _buildTaxAdvisorStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 347.v,
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage,
              height: 297.v,
              width: 360.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 19.h,
                  bottom: 35.v,
                ),
                child: Text(
                  " Tax Advisory system",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
