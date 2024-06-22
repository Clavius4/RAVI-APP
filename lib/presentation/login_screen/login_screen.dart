import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax_advisory_app/core/utils/app_texts.dart';
import 'package:tax_advisory_app/presentation/register_screen/register_screen.dart';
import 'package:tax_advisory_app/presentation/register_success_screen/register_success_screen.dart';
import 'package:tax_advisory_app/services/login_service.dart';
import 'package:tax_advisory_app/sessions/session_manager.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../app_in_screen/app_in_screen.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newText = newValue.text;
    if (newText.length > 12) {
      return oldValue;
    }
    if (newText.startsWith('255')) {
      return newValue;
    }
    return TextEditingValue(
      text: '255${newText}',
      selection: TextSelection.collapsed(offset: newText.length + 3),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

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
          child: Form(
            key: _formKey,
            child: SizedBox(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: SizeUtils.height,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _buildTaxAdvisorySystemStack(context),
                      Positioned(
                        bottom: 2,  // Adjust the bottom position as needed
                        left: 2,    // Adjust the left position as needed
                        child: TextButton(
                          onPressed: () {
                            // Add onPressed logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            UsedWords.accountRegister,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 33.h),
                                  child: Text(
                                    UsedWords.titleLogin,
                                    style: CustomTextStyles
                                        .bodyMediumOnPrimaryContainer,
                                  ),
                                ),
                              ),
                              SizedBox(height: 64.v),
                              CustomTextFormField(
                                controller: emailController,
                                hintText: "255xxxxxxxxx",
                                textInputType: TextInputType.emailAddress,
                                inputFormatters: [PhoneInputFormatter()],
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      19.h, 22.v, 30.h, 22.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgLock,
                                    height: 11.v,
                                    width: 14.h,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 56.v,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 36.v),
                              CustomTextFormField(
                                controller: passwordController,
                                hintText: UsedWords.password,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 18.v, 30.h, 18.v),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgLockPrimary,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 56.v,
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 43.v),
                              TextButton(
                                onPressed: () {
                                  // Handle button press
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                        (route) => false,
                                  );
                                  print('Already have account? Sign Up');
                                },
                                child: Text('Already have account? Sign Up'),
                              ),
                              SizedBox(height: 10,),
                              CustomElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    // Simulate a delay for the loading indicator
                                    await Future.delayed(Duration(seconds: 2));

                                    setState(() {
                                      isLoading = false;
                                    });

                                    // Navigate to the next screen and show a snackbar
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNavScreen(),
                                      ),
                                          (route) => false,
                                    );
                                    LoginService.loginUser(emailController.text, passwordController.text);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Login Successful"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please fill all fields"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                text: isLoading ? "" : UsedWords.loginButton,
                                rightIcon: isLoading
                                    ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                                    : null,
                              ),
                              SizedBox(height: 37.v),
                              SizedBox(height: 3.v)
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
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
