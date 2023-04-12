import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kleidung_app/src/pages/login/login_controller.dart';
import 'package:kleidung_app/src/utils/colors_app.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  void initState()
  {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp)
    {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                    top: -80,
                    left: -100,
                    child: _rectangleLogin()
                ),
                Positioned(
                    top: 50,
                    left: 25,
                    child: _textLogin()
                ),
                SingleChildScrollView(
                  child: Column(
                      children: [
                        //_imageBanner(),
                        _lottieAnimation(),
                        _textKleidung(),
                        SizedBox(height: 50),
                        _textFieldEmail(),
                        _textFieldPassword(),
                        _buttonLogin(),
                        _textDontHaveAccount()
                      ]
                  ),
                ),
              ],
            )
        )
    );
  }

  Widget _rectangleLogin()
  {
    return Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: colors_app.principalColor
        )
    );
  }

  Widget _textLogin()
  {
    return Text(
      'INICIO DE SESIÓN',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _lottieAnimation()
  {
    return Container(
      margin: EdgeInsets.only(
          top: 150,
          bottom: MediaQuery.of(context).size.height * 0
      ),
      child: Lottie.asset(
          'assets/json/shopping.json',
          width: 350,
          height: 200,
          fit: BoxFit.fill
      ),
    );
  }

  Widget _textKleidung()
  {
    return Text(
      'KLEIDUNG FASHION',
      style: TextStyle(
          color: colors_app.principalColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: 'OneDay'
      ),
    );
  }

  Widget _textFieldEmail()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Correo electrónico',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.email,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  Widget _textFieldPassword()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.passwordController,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Contraseña',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.lock,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  Widget _buttonLogin()
  {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: ElevatedButton(
            onPressed: _con.login,
            child: Text('Iniciar Sesión'),
            style: ElevatedButton.styleFrom(
                backgroundColor: colors_app.principalColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                padding: EdgeInsets.symmetric(vertical: 15)
            )
        )
    );
  }

  Widget _textDontHaveAccount()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
            '¿No tienes cuenta?',
            style: TextStyle(
                color: colors_app.principalColor
            )
        ),
        SizedBox(width: 7),
        GestureDetector(
            onTap: _con.goToRegisterPage,
            child: Text(
              'Registrate',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors_app.principalColor
              ),
            )
        )
      ],
    );
  }
}
