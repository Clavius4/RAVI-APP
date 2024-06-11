import 'package:flutter/material.dart';
import 'package:tax_advisory_app/presentation/register_success_screen/register_success_screen.dart';
import 'package:tax_advisory_app/services/registration_service.dart';
import '../../core/app_export.dart';
import '../../widgets/CustomDropdownFormField.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../app_in_screen/app_in_screen.dart';
import '../otp/otp_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  PersonalInfoScreen({Key? key, required this.phoneNumber, required this.password}) : super(key: key);
  final TextEditingController phoneNumber, password;

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedTaxRegion;
  String? selectedOrganizationType;
  bool isLoading = false;

  final List<String> taxRegions = [
    'Dodoma',
    'Dar es salaam',
    'Mwanza',
    'Arusha',
    'Mara',
    'Pwani',
    'Morogoro',
    'Tanga',
    'Mbeya',
    'Manyara'
  ];

  final List<String> organizationTypes = [
    'Government/Institutes',
    'NGOs',
    'Limited Company',
    'Joint-Venture/Partnership',
    'Trust',
    'Others'
  ];

  String? selectedDistrict;
  final List<String> districtList = [
    // Districts for Dodoma
    'Dodoma District 1', 'Dodoma District 2', 'Dodoma District 3',

    // Districts for Dar es Salaam
    'Dar es Salaam District 1', 'Dar es Salaam District 2', 'Dar es Salaam District 3',

    // Districts for Mwanza
    'Mwanza District 1', 'Mwanza District 2', 'Mwanza District 3',

    // Districts for Arusha
    'Arusha District 1', 'Arusha District 2', 'Arusha District 3',

    // Districts for Mara
    'Mara District 1', 'Mara District 2', 'Mara District 3',

    // Districts for Pwani
    'Pwani District 1', 'Pwani District 2', 'Pwani District 3',

    // Districts for Morogoro
    'Morogoro District 1', 'Morogoro District 2', 'Morogoro District 3',

    // Districts for Tanga
    'Tanga District 1', 'Tanga District 2', 'Tanga District 3',

    // Districts for Mbeya
    'Mbeya District 1', 'Mbeya District 2', 'Mbeya District 3',

    // Districts for Manyara
    'Manyara District 1', 'Manyara District 2', 'Manyara District 3'
  ]; // Define your list of districts



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
                                    "Personal Information",
                                    style: CustomTextStyles
                                        .bodyMediumOnPrimaryContainer,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 33.h),
                                  child: Text(
                                    "Our Team will respond as quickly as possible.",
                                    style: CustomTextStyles
                                        .bodyMediumOnPrimaryContainer,
                                  ),
                                ),
                              ),
                              SizedBox(height: 64.v),
                              CustomTextFormField(
                                controller: firstNameController,
                                hintText: "Enter your First name",
                                textInputType: TextInputType.text,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                    19.h,
                                    22.v,
                                    30.h,
                                    22.v,
                                  ),
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
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 36.v),
                              CustomTextFormField(
                                controller: lastNameController,
                                hintText: "Enter your Last name",
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.text,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                    16.h,
                                    18.v,
                                    30.h,
                                    18.v,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgLockPrimary,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: 56.v,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 36.v),
                              Row(
                                children: [
                                  Expanded(
                                    flex: selectedTaxRegion != null ? 1 : 2, // Adjust flex based on selection
                                    child: CustomDropdownFormField<String>(
                                      height: 55.v,
                                      value: selectedTaxRegion,
                                      hintText: "Select Tax Region",
                                      items: taxRegions.map((String region) {
                                        return DropdownMenuItem<String>(
                                          value: region,
                                          child: Text(
                                            region,
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedTaxRegion = newValue;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select a tax region';
                                        }
                                        return null;
                                      },
                                      borderRadius: 10.v,
                                    ),
                                  ),
                                  SizedBox(width: 16.h),
                                  if (selectedTaxRegion != null)
                                    Expanded(
                                      flex: 1,
                                      child: CustomDropdownFormField<String>(
                                        height: 55.v,
                                        value: selectedDistrict,
                                        hintText: "Select District",
                                        items: districtList.map((String district) {
                                          return DropdownMenuItem<String>(
                                            value: district,
                                            child: Text(
                                              district,
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedDistrict = newValue;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select a district';
                                          }
                                          return null;
                                        },
                                        borderRadius: 10.v,
                                      ),
                                    ),
                                ],
                              ),

                              SizedBox(height: 36.v),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Flexible(
                                      fit: FlexFit.tight,
                                      child: CustomDropdownFormField<String>(
                                        height: 55.v,
                                        value: selectedOrganizationType,
                                        hintText: "Organization Type",
                                        items: organizationTypes.map((String type) {
                                          return DropdownMenuItem<String>(
                                            value: type,
                                            child: Text(
                                              type,
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedOrganizationType = newValue;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select an organization type';
                                          }
                                          return null;
                                        },
                                        fillColor: Colors.white,
                                        borderRadius: 10.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.h),
                                  Expanded(
                                    flex: 1,
                                    child: Flexible(
                                      fit: FlexFit.tight,
                                      child: CustomTextFormField(
                                        controller: organizationNameController,
                                        hintText: "Organization Name",
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.text,
                                        prefix: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
                                        ),
                                        prefixConstraints: BoxConstraints(
                                          maxHeight: 56.v,
                                          maxWidth: 40.h,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your organization name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 43.v),
                              CustomElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(()
                                    {
                                      isLoading = true;
                                    });

                                    // Simulate a delay for the loading indicator
                                    await Future.delayed(Duration(seconds: 2));

                                    setState(() {
                                      isLoading = false;
                                    });
                                    RegisterService.registerUser(widget.phoneNumber.text, widget.password.text, firstNameController.text, lastNameController.text, selectedTaxRegion.toString(), selectedDistrict.toString(), selectedOrganizationType.toString(), organizationNameController.text);
                                    // Navigate to the next screen and show a snackbar
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OTPScreen(),
                                      ),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Registration Successful"),
                                        backgroundColor: Colors.green, // Set snackbar color to green for success
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Please fill all fields"),
                                        backgroundColor: Colors.red, // Set snackbar color to red for failure
                                      ),
                                    );
                                  }
                                },
                                text: isLoading ? "" : "Register",
                                rightIcon: isLoading
                                    ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                                    : null,
                              ),
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
