import 'package:flutter/material.dart';
import 'package:kleidung_app/src/models/response_api.dart';
import 'package:kleidung_app/src/models/user.dart';
import 'package:kleidung_app/src/provider/user_provider.dart';
import 'package:kleidung_app/src/utils/my_snackbar.dart';
import 'package:kleidung_app/src/utils/shared_pref.dart';

class LoginController
{
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UserProvider usersProvider = new UserProvider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async
  {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});
    if(user?.sessionToken != null) {
      Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
  }

  }

  void goToRegisterPage()
  {
    Navigator.pushNamed(context, 'register');
  }

  void login() async
  {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    ResponseApi responseApi = await usersProvider.login(email, password);

    if(responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
    }
    else {
      MySnackbar.show(context, responseApi.message);
    }

    print('Respuesta Object: ${responseApi}');
    print('Respuesta: ${responseApi.toJson()}');
    MySnackbar.show(context, responseApi.message);

    print('Email: $email');
    print('Password: $password');
  }
}