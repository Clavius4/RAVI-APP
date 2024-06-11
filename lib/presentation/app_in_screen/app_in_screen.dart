import 'package:flutter/material.dart';
import 'package:tax_advisory_app/presentation/activities/activities.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class AppInScreen extends StatefulWidget {
  const AppInScreen({Key? key}) : super(key: key);

  @override
  _AppInScreenState createState() => _AppInScreenState();
}

class _AppInScreenState extends State<AppInScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

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
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTaxAdvisorySystemStack(context),
                SizedBox(
                  height: 430.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 52.v,
                          ),
                          decoration: AppDecoration.outlineBlackF.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL30,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildColumnSelectTaxAdvisor(context),
                              SizedBox(height: 30.v),
                              CustomElevatedButton(
                                text: "Select",
                                buttonStyle: CustomButtonStyles.outlineBlackF,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ActivitiesScreen(), // Replace YourNextScreen with the actual screen you want to navigate to
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnSelectTaxAdvisor(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: AppDecoration.outlineBlack9003f.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 73.h,
              vertical: 36.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 3.v),
                Text(
                  "Tax Advisory Service",
                  style: CustomTextStyles.titleMediumBold,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 28.v),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 64.h,
            vertical: 24.v,
          ),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: SizedBox(
            width: 201.h,
            child: Text(
              "Capacity Development\nServices",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumPrimary,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTaxAdvisorySystemStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 310.v,
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
              child: Transform.translate(
                offset: Offset(39.h, 0.v), // Adjust these values to move the text
                child: Text(
                  "Select Your Service For Help",
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
