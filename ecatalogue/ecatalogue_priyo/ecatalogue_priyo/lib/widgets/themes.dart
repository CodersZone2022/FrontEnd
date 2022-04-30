import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepOrange,
        cardColor: Colors.white,
        canvasColor: orange,
        buttonColor: deeporange,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.orangeAccent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.blueGrey),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkcreame,
        buttonColor: lightorange,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );

  //colors
  static Color creamColor = Color.fromARGB(255, 165, 145, 116);
  static Color BlueGrey = Colors.blueGrey;
  static Color orange = Colors.orangeAccent;
  static Color deeporange = Color.fromARGB(255, 238, 77, 3);
  static Color darkcreame = Vx.gray900;
  static Color lightorange = Vx.orange400;
}
