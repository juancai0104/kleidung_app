import 'package:flutter/material.dart';
import 'package:kleidung_app/src/models/response_api.dart';
import 'package:kleidung_app/src/models/user.dart';
import 'package:kleidung_app/src/provider/user_provider.dart';
import 'package:kleidung_app/src/utils/my_snackbar.dart';

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

  UserProvider usersProvider = new UserProvider();

  Future init(BuildContext context)
  {
    this.context = context;
    usersProvider.init(context);
  }

  void goToLoginPage()
  {
    Navigator.pushNamed(context, 'login');
  }

  void register() async
  {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String birthdate = birthDateController.text;
    String phoneNumber = phoneNumberController.text.trim();
    String address = addressController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if(email.isEmpty || name.isEmpty || lastName.isEmpty || phoneNumber.isEmpty
        || password.isEmpty || confirmPassword.isEmpty) {

      MySnackbar.show(context, 'Debes registrar todos los campos');
      return;
    }

    if(confirmPassword != password) {
      MySnackbar.show(context, 'Las contraseñas digitadas no coinciden');
      return;
    }

    if(password.length < 6) {
      MySnackbar.show(context, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    User user = new User(
        email: email,
        name: name,
        lastname: lastName,
        phone: phoneNumber,
        password: password
    );

    ResponseApi responseApi = await usersProvider.create(user);

    MySnackbar.show(context, responseApi.message);

    print('RESPUESTA: ${responseApi.toJson()}');
  }
}