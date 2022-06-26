import 'package:doctor_booking/pages/aurth/sign_in_page.dart';
import 'package:doctor_booking/pages/doctor_booking_page.dart';
import 'package:doctor_booking/pages/home_page.dart';
import 'package:doctor_booking/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_aarnyacatalog_project/pages/address/add_address_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/auth/sign_in_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/cart/cart_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/discount/discount_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/food/popular_food_detail.dart';
// import 'package:flutter_aarnyacatalog_project/pages/food/recommended_food_detail.dart';
// import 'package:flutter_aarnyacatalog_project/pages/home/home_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/home/main_food_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/product_list/product_list.dart';
// import 'package:flutter_aarnyacatalog_project/pages/pyment/dashboard_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/splash/splash_page.dart';
// import 'package:flutter_aarnyacatalog_project/pages/wishlist/wishlist_history.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String booking = "/booking";
  static const String signIn = "/sign-in";
  // static const String recommendedFood = "/recommended-food";
  // static const String cartPage = "/cart-page";
  // static const String signIn = "/sign-in";
  // static const String productList = "/product-list";
  // static const String dashboard = "/dashboard";
  // static const String wishlist = "/wishlist";
  // static const String discountPage = "/discount-Page";

  //static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getDoctorBookingPage() => '$booking';
  static String getSignInPage() => '$signIn';
  // static String getPopularFood(int pageId, String page) =>
  //     '$popularFood?pageId=$pageId&page=$page';
  // static String getRecommendedFood(int pageId, String page) =>
  //     '$recommendedFood?pageId=$pageId&page=$page';
  // static String getCartPage() => '$cartPage';
  // static String getSignInPage() => '$signIn';
  // static String getAddressPage() => '$addAddress';
  // static String getProductList() => '$productList';
  // static String getDashboardPage() => '$dashboard';
  // static String getWishlistHistoryPage() => '$wishlist';
  // static String getDiscountPage() => '$discountPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: booking, page: () => DoctorBookingPage()),
    GetPage(
      name: signIn, page: () => SignInPage(), transition: Transition.fade),
  ];
  //   GetPage(
  //       name: signIn, page: () => SignInPage(), transition: Transition.fade),
  //   GetPage(
  //       name: popularFood,
  //       page: () {
  //         var pageId = Get.parameters['pageId'];
  //         var page = Get.parameters["page"];
  //         return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
  //       },
  //       transition: Transition.fadeIn),
  //   GetPage(
  //       name: recommendedFood,
  //       page: () {
  //         var pageId = Get.parameters['pageId'];
  //         var page = Get.parameters["page"];
  //         return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
  //       },
  //       transition: Transition.fadeIn),
  //   GetPage(
  //       name: cartPage,
  //       page: () {
  //         return CartPage();
  //       },
  //       transition: Transition.fadeIn),
  //   GetPage(
  //       name: addAddress,
  //       page: () {
  //         return AddAddressPage();
  //       }),
  //   GetPage(name: productList, page: () => ProductList()),
  //   GetPage(name: dashboard, page: () => DashboardPage()),
  //   GetPage(
  //       name: wishlist,
  //       page: () {
  //         return WishlistHistory();
  //       },
  //       transition: Transition.fadeIn),
  //   GetPage(name: discountPage, page: () => DiscountPage()),
  // ];
}
