import 'package:doctor_booking/pages/account/account_page.dart';
import 'package:doctor_booking/pages/aurth/create_new_password.dart';
import 'package:doctor_booking/pages/aurth/forget_account_page.dart';
import 'package:doctor_booking/pages/aurth/otp_page.dart';
import 'package:doctor_booking/pages/aurth/register_page.dart';
import 'package:doctor_booking/pages/aurth/sign_in_page.dart';
import 'package:doctor_booking/pages/doctor_booking_page.dart';
import 'package:doctor_booking/pages/home_page.dart';
import 'package:doctor_booking/pages/splash_page.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/theme/theme_services.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

    //home: const SignInPage(),
     initialRoute: RouteHelper.getSplashPage(),
     getPages: RouteHelper.routes,
    );
  }
}
