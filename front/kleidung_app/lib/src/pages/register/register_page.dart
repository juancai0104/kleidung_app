import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:kleidung_app/src/pages/register/register_controller.dart';
import 'package:kleidung_app/src/utils/colors_app.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = new RegisterController();

  @override
  void initState()
  {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
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
                    child: _rectangleRegister()
                ),
                Positioned(
                    top: 45,
                    left: 5,
                    child: _iconBack()
                ),
                Positioned(
                    top: 50,
                    left: 30,
                    child: _textRegister()
                ),
                Container(
                    margin: EdgeInsets.only(top: 150),
                    width: double.infinity,
                    child: SingleChildScrollView(
                        child: Column(
                            children: [
                              _imageUser(),
                              SizedBox(height: 10),
                              _textFieldName(),
                              _textFieldLastName(),
                              _textFieldBirthDate(),
                              //_dateBirth(),
                              _textFieldPhoneNumber(),
                              _textFieldAddress(),
                              _textFieldEmail(),
                              _textFieldPassword(),
                              _textFieldConfirmPassword(),
                              _buttonRegister()
                            ]
                        )
                    )
                )
              ],
            )
        )
    );
  }

  Widget _rectangleRegister()
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

  Widget _iconBack()
  {
    return IconButton(
        onPressed: _con.goToLoginPage,
        icon: Icon(Icons.arrow_back_ios, color: Colors.white)
    );
  }

  Widget _textRegister()
  {
    return Text(
      'REGISTRARSE',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _imageUser()
  {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _textFieldName()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.nameController,
          decoration: InputDecoration(
              hintText: 'Nombres',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.person,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  Widget _textFieldLastName()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.lastNameController,
          decoration: InputDecoration(
              hintText: 'Apellidos',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.person_2,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  Widget _textFieldBirthDate()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.birthDateController,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
              hintText: 'Fecha de nacimiento. Ej. 01/01/2000',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.date_range,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  /*Widget _dateBirth()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
        child: DatePickerWidget(
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          firstDate: DateTime.now().add(Duration(days: -(365*150))),
          dateFormat: "dd-MM-yyyy",

        )
    );
  }*/

  Widget _textFieldPhoneNumber()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.phoneNumberController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Teléfono',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.phone,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  Widget _textFieldAddress()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.addressController,
          decoration: InputDecoration(
              hintText: 'Dirección de residencia',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              prefixIcon: Icon(
                  Icons.home,
                  color: colors_app.principalColor
              )
          )
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
              hintText: 'Correo electronico',
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
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                  Icons.lock_outline,
                  color: colors_app.principalColor
              )
          )
      ),
    );
  }

  Widget _textFieldConfirmPassword()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: colors_app.textfieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
          controller: _con.confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirmar contraseña',
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

  Widget _buttonRegister()
  {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ElevatedButton(
            onPressed: _con.register,
            child: Text('Registrarse'),
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
}
