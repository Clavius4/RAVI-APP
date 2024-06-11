import 'package:flutter/material.dart';
import 'package:tax_advisory_app/presentation/personal_info_screen/personal_info_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../app_in_screen/app_in_screen.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({Key? key})
      : super(
          key: key,
        );

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
              colors: [theme.colorScheme.primaryContainer, appTheme.gray100],
            ),
          ),
          child: SizedBox(
            child: SingleChildScrollView(
              child: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _buildTaxAdvisorySystem(context),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.h,
                          vertical: 30.v,
                        ),
                        decoration: AppDecoration.fillBluegray5001.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL38,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgIllustrationFeature,
                              height: 275.adaptSize,
                              width: 275.adaptSize,
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 19.h),
                            ),
                            Text(
                              "You are successfully registered!",
                              style: CustomTextStyles
                                  .titleLargeCommissionerPrimary,
                            ),
                            SizedBox(height: 8.v),
                            CustomElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(), // Replace YourNextScreen with the actual screen you want to navigate to
                                  ),
                                );
                              },
                              text: "Go to Application",
                            ),
                            SizedBox(height: 37.v),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "By continuing I agree with the ",
                                    style: CustomTextStyles.interOnPrimary,
                                  ),
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style:
                                        CustomTextStyles.interBlueA400.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ", ",
                                    style: CustomTextStyles.interOnPrimary,
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style:
                                        CustomTextStyles.interBlueA400.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 40.v)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaxAdvisorySystem(BuildContext context) {
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
                  left: 21.h,
                  bottom: 38.v,
                ),
                child: Text(
                  " Tax Advisory system",
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
