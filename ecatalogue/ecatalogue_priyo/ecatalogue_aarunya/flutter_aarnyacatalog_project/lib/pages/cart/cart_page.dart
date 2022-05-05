import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/base/no_data_page.dart';
import 'package:flutter_aarnyacatalog_project/controllers/auth_controller.dart';
import 'package:flutter_aarnyacatalog_project/controllers/cart_controller.dart';
import 'package:flutter_aarnyacatalog_project/controllers/location_controller.dart';
import 'package:flutter_aarnyacatalog_project/controllers/popular_product_controller.dart';
import 'package:flutter_aarnyacatalog_project/controllers/recommended_product_controller.dart';
import 'package:flutter_aarnyacatalog_project/pages/home/main_food_page.dart';
import 'package:flutter_aarnyacatalog_project/routes/route_helper.dart';
import 'package:flutter_aarnyacatalog_project/utils/app_constants.dart';
import 'package:flutter_aarnyacatalog_project/utils/colors.dart';
import 'package:flutter_aarnyacatalog_project/utils/dimensions.dart';
import 'package:flutter_aarnyacatalog_project/widgets/app_icon.dart';
import 'package:flutter_aarnyacatalog_project/widgets/big_text.dart';
import 'package:flutter_aarnyacatalog_project/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Your Cart",
          size: Dimensions.font26,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20,
              left: Dimensions.widht20,
              right: Dimensions.widht20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.widht20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.widht20,
                    right: Dimensions.widht20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (CartController) {
                          var _cartList = CartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  width: double.maxFinite,
                                  height: Dimensions.height20 * 5,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularIndex, "cartpage"));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            if (recommendedIndex < 0) {
                                              Get.snackbar(
                                                "History product",
                                                "Product review is not availble for history products",
                                                backgroundColor:
                                                    AppColors.textwarning,
                                                colorText: Colors.white,
                                              );
                                            } else {
                                              Get.toNamed(RouteHelper
                                                  .getRecommendedFood(
                                                      recommendedIndex,
                                                      "cartpage"));
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: Dimensions.height20 * 5,
                                          height: Dimensions.height20 * 5,
                                          margin: EdgeInsets.only(
                                              bottom: Dimensions.height10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          CartController
                                                              .getItems[index]
                                                              .img!)),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: CartController
                                                  .getItems[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text: CartController
                                                      .getItems[index].price!
                                                      .toString(),
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions
                                                                  .radius20),
                                                      color: Colors.white),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          CartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width10 /
                                                                2,
                                                      ),
                                                      BigText(
                                                          text: _cartList[index]
                                                              .quantity
                                                              .toString()), // popularProduct.inCartItems.toString()),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width10 /
                                                                2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          CartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              });
                        }),
                      ),
                    ))
                : NoDataPage(text: "Your cart is empty!");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (CartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.widht20,
                right: Dimensions.widht20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: CartController.getItems.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.widht20,
                            right: Dimensions.widht20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimensions.width10 / 2,
                            ),
                            BigText(
                                text: "\$" +
                                    CartController.totalAmount.toString()),
                            SizedBox(
                              width: Dimensions.width10 / 2,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (Get.find<AuthController>().userLoggedIn()) {
                            //CartController.addToHistory();
                            if (Get.find<LocationController>()
                                .addressList
                                .isEmpty) {
                              Get.toNamed(RouteHelper.getAddressPage());
                            }
                          } else {
                            Get.toNamed(RouteHelper.getSignInPage());
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.widht20,
                              right: Dimensions.widht20),
                          child: BigText(
                            text: "Check out ",
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
