import 'package:flutter/material.dart';
import 'package:tax_advisory_app/presentation/register_success_screen/register_success_screen.dart';
import 'package:tax_advisory_app/services/registration_service.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
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
                alignment: Alignment.bottomCenter,
                children: [
                  _buildTaxAdvisorySystemStack(context),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 66.v,
                      ),
                      decoration: AppDecoration.fillBluegray5001.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL38,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Enter the OTP Code",
                            style: CustomTextStyles.bodyMediumOnPrimaryContainer,
                          ),
                          SizedBox(height: 64.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildOTPDigitField(),
                              _buildOTPDigitField(),
                              _buildOTPDigitField(),
                              _buildOTPDigitField(),
                              _buildOTPDigitField(),
                              _buildOTPDigitField(),
                            ],
                          ),
                          SizedBox(height: 20.v),
                          TextButton(
                            onPressed: () {
                              // Resend OTP code logic here
                            },
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 37.v),
                          CustomElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterSuccessScreen(),
                                ),
                              );
                            },
                            text: "Submit",
                          ),
                          SizedBox(height: 3.v),
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
    );
  }

  /// Section Widget
  Widget _buildTaxAdvisorySystemStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 330.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              top: 30,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Enter Verification Code",
                      style: theme.textTheme.headline1!.copyWith(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Enter the OTP we have sent to your contact +255xx......",
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


  Widget _buildOTPDigitField() {
    return SizedBox(
      width: 50.h,
      child: TextFormField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
