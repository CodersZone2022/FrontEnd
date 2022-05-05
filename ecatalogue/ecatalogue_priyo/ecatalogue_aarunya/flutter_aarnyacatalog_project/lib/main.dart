import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/controllers/cart_controller.dart';
import 'package:flutter_aarnyacatalog_project/controllers/popular_product_controller.dart';
import 'package:flutter_aarnyacatalog_project/pages/address/add_address_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/auth/sign_in_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/cart/cart_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/discount/discount_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/food/popular_food_detail.dart';

import 'package:flutter_aarnyacatalog_project/pages/food/recommended_food_detail.dart';
import 'package:flutter_aarnyacatalog_project/pages/home/food_page_body.dart';

import 'package:flutter_aarnyacatalog_project/pages/home/main_food_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/product_list/product_list.dart';
import 'package:flutter_aarnyacatalog_project/pages/pyment/dashboard_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/splash/splash_page.dart';
import 'package:flutter_aarnyacatalog_project/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 //Stripe.publishableKey = 'pk_test_51KutPMSCWDFyhtjfA2TqSSa1omwDUZX0Kg9uaRYxy3Dk1sDNOGhGRzNxeFHnRPNWvp1i95R4s6hDR68GN2i7nsxb00AaMg4mCD';
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
         // home: DiscountPage(),
          //home: SplashScreen(),
           initialRoute: RouteHelper.getSplashPage(),
           getPages: RouteHelper.routes,
        );
      });
    });
  }
}
