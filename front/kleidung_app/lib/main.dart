import 'package:flutter/material.dart';
import 'package:kleidung_app/src/pages/client/products/list/client_products_list_page.dart';
import 'package:kleidung_app/src/pages/login/login_page.dart';
import 'package:kleidung_app/src/pages/register/register_page.dart';
import 'package:kleidung_app/src/utils/colors_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kleidung Fashion',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'client/products/list': (BuildContext context) => ClientProductsListPage()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: colors_app.backgroundColor
    ),
    );
  }
}