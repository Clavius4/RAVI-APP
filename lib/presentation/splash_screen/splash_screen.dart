import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.languageScreen, (route) => false);
    });

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
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 74.h,
                        vertical: 152.v,
                      ),
                      decoration: AppDecoration.fillPrimaryContainer,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 268.v),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "RAVI",
                                style: CustomTextStyles.titleLargePrimary,
                              ),
                            ),
                            SizedBox(height: 183.v),
                            CustomImageView(
                              imagePath: ImageConstant.imgMobile,
                              height: 31.adaptSize,
                              width: 31.adaptSize,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 406.v,
                            width: 238.h,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse1,
                                  height: 332.v,
                                  width: 195.h,
                                  alignment: Alignment.topRight,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant
                                      .imgPhoto20240215185014,
                                  height: 100.adaptSize,
                                  width: 100.adaptSize,
                                  radius: BorderRadius.circular(
                                    24.h,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 51.v),
                          SizedBox(
                            height: 500.v,
                            width: double.maxFinite,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath:
                                  ImageConstant.imgEllipse1500x250,
                                  height: 500.v,
                                  width: 250.h,
                                  alignment: Alignment.centerLeft,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
