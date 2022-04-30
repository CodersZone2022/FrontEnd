import 'package:ecatalogue_priyo/core/store.dart';
import 'package:ecatalogue_priyo/pages/cart_page.dart';
import 'package:ecatalogue_priyo/pages/home_page.dart';
import 'package:ecatalogue_priyo/pages/login_page.dart';
import 'package:ecatalogue_priyo/utils/routes.dart';
import 'package:ecatalogue_priyo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MYApp()));
}

class MYApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => Loginpage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => Loginpage(),
        MyRoutes.cartRoute: (context) => Cartpage(),
      },
    );
  }
}
