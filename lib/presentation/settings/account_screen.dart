import 'package:flutter/material.dart';

import '../../widgets/custom_text_form_field.dart';

class AccountScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Settings', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hintText: 'First Name',
              controller: firstNameController,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Last Name',
              controller: lastNameController,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Phone Number',
              controller: phoneNumberController,
              // keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Text(
              "Add your email and password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Email',
              controller: emailController,
              // keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Password',
              controller: passwordController,
              // isPassword: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save details logic goes here
                _saveDetails(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveDetails(BuildContext context) {
    // Perform saving details logic here

    // Navigate back to settings screen
    Navigator.of(context).pop();
  }
}
