import 'package:flutter/material.dart';

class RegisterController
{
  BuildContext context;

  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController birthDateController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  Future init(BuildContext context)
  {
    this.context = context;
  }

  void goToLoginPage()
  {
    Navigator.pushNamed(context, 'login');
  }

  void register()
  {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String dateBirth = birthDateController.text;
    String phoneNumber = phoneNumberController.text.trim();
    String address = addressController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print(name);
    print(lastName);
    print(dateBirth);
    print(phoneNumber);
    print(address);
    print(email);
    print(password);
    print(confirmPassword);
  }
}