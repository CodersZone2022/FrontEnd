import 'package:flutter/cupertino.dart';

class AppColors {

  //Text Colors:
  static final Color textColor = const Color(0xFFccc7c5);
  static final Color textColor2 = const Color(0xFFf7f6f4);
  static final Color hinttext = const Color(0xFFa9a29f);
  static final Color textwarning = const Color(0xFFD50000);
  static final Color titleColor = const Color(0xFF5c524f);
  static final Color mainBlackColor = const Color(0xFF332d2b);
  static final Color paraColor = const Color(0xFF8f837f);
  static final Color paraColor2 = const Color(0xFF691769);
  static final Color paraColor3 = const Color(0xFF01680A);

  

  //Icon Colors:
  static final Color iconColor1 = const Color(0xFFffd28d);
  static final Color iconColor2 = const Color(0xFFfcab88);
  static final Color iconColor3 = const Color(0xFF00B8D4);
  static final Color yellowColor = const Color(0xFFEEFF41);
  static final Color iconColor4 = const Color(0xFFD50000);
  static final Color paraColor5 = const Color(0xFF01680A);
  static final Color paraColor6 = const Color(0xFF691769);
  static final Color iconColor7 = const Color(0xFF006ED4);
  static final Color iconColor8 = const Color(0xFF332d2b);
  static final Color iconColor9 = const Color(0xFFf7f6f4);

  //Normel  Background Shadow:
  static final Color buttonBackgroundColor = const Color(0xFFf7f6f4);
  static final Color shadow = const Color(0xffCFD1CA);
  static final Color shadow1 = const Color(0xFFa9a29f);
  static final Color shadow2 = const Color(0xFFB3B8AC);
  static final Color shadow3 = const Color(0xFFBFBEBC);

  //Theme: (Light_Blue)

  //App-Bar Colors:(Light_Blue)
  static final Color mainColor1 = const Color(0xFF00E5FF);
  static final Color mainblueColor2 = const Color(0xff52F7CC);
  static final Color  mainblueColor3 = const Color(0xff8CFBA9);
  static final Color  mainblueColor4 = const Color(0xff0CB3AA);

  //Background colors:(Light_Blue)
  static final Color bluebody = const Color(0xFF84FFFF);
  static final Color backgroundColor0 = const Color(0xffEFFCF9);
  static final Color bluebody1 = const Color(0xffC5FCEE);
  static final Color bluebody_2 = const Color(0xffC1FCF6);

  //Gradient Backgrond Colors:(Light_Blue)
  static final LinearGradient backgroundColor3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xff2BAFE5),
      Color(0xff00C6E4),
      Color(0xff00DAD0),
      Color(0xff59EAAE),
      Color(0xffACF58A),
      Color(0xffF9F871)
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );

  static final LinearGradient bluebody4 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xff00E5FF),
      Color(0xff00C7FF),
      Color(0xff4FA5FB),
      Color(0xff8A7EDB),
      Color(0xffAA52A7),
      Color(0xffAF2267)
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );

  static final LinearGradient bluebody5 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xff00E5FF),
      Color(0xff29EEEB),
      Color(0xff5EF4D2),
      Color(0xff5EF4D2),
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );

  static final LinearGradient bluebody6 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xff00E5FF),
      Color(0xff00EFEA),
      Color(0xff52F7CC),
      Color(0xff8CFBA9),
      Color(0xffC3FC88),
      Color(0xffF9F871)
    ], // Gradient from https://learnui.design/tools/gradient-generator.html
    tileMode: TileMode.mirror,
  );
}
