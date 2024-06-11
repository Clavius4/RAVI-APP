// lib/controllers/register_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_advisory_app/models/user_model.dart';
import 'package:tax_advisory_app/services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService _authService = AuthService();

  var isLoading = false.obs;

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final regionController = TextEditingController();
  final districtController = TextEditingController();
  final organisationTypeController = TextEditingController();
  final organisationNameController = TextEditingController();

  Future<void> register() async {
    isLoading.value = true;

    try {
      UserModel user = UserModel(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        region: regionController.text,
        district: districtController.text,
        organisationType: organisationTypeController.text,
        organisationName: organisationNameController.text,
      );

      String response = await _authService.register(user);
      Get.snackbar('Success', response);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
