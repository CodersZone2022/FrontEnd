import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/controllers/recommended_product_controller.dart';
import 'package:flutter_aarnyacatalog_project/routes/route_helper.dart';
import 'package:flutter_aarnyacatalog_project/utils/app_constants.dart';
import 'package:flutter_aarnyacatalog_project/utils/colors.dart';
import 'package:flutter_aarnyacatalog_project/utils/dimensions.dart';
import 'package:flutter_aarnyacatalog_project/widgets/app_icon.dart';
import 'package:flutter_aarnyacatalog_project/widgets/big_text.dart';
import 'package:flutter_aarnyacatalog_project/widgets/icon_and_text_widget.dart';
import 'package:flutter_aarnyacatalog_project/widgets/small_text.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: Dimensions.height10 * 10,
              color: AppColors.mainColor,
              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.height45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(
                    text: "Products",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.widht20 * 5,
                  ),
                  AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.search,
                  ),
                  SizedBox(
                    width: Dimensions.widht20,
                  ),
                  GestureDetector(
                    onTap: (){
                       Get.toNamed(RouteHelper.getDiscountPage());
                    },
                    child: AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.discount_outlined,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.widht20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.shopping_cart,
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<RecommendedProductController>(
                builder: (recommendedProduct) {
              return recommendedProduct.isLoaded
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          recommendedProduct.recommendedProductList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                RouteHelper.getRecommendedFood(index, "home"));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.widht20,
                                right: Dimensions.widht20,
                                bottom: Dimensions.height10),
                            child: Row(
                              children: [
                                //image Section
                                Container(
                                  width: Dimensions.listViewImgSize,
                                  height: Dimensions.listViewImgSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white38,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(AppConstants
                                                  .BASE_URL +
                                              AppConstants.UPLOAD_URL +
                                              recommendedProduct
                                                  .recommendedProductList[index]
                                                  .img!))),
                                ),
                                // Text Section
                                Expanded(
                                  child: Container(
                                    height: Dimensions.listViewTextContSize,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius20)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10,
                                          right: Dimensions.width10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BigText(
                                              text: recommendedProduct
                                                  .recommendedProductList[index]
                                                  .name!),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          SmallText(
                                              text:
                                                  "With Chinese Characteristics"),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: "\$10.23",
                                                color: AppColors.textwarning,
                                              ),
                                              AppIcon(
                                                icon: Icons.favorite,
                                                iconColor: AppColors.mainColor,
                                                size: Dimensions.iconSize16,
                                              ),
                                              IconAndTextWidget(
                                                  icon: Icons.add_shopping_cart,
                                                  text: "Add Now",
                                                  iconColor:
                                                      AppColors.iconColor2),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : CircularProgressIndicator(
                      color: AppColors.mainColor,
                    );
            })
          ]),
        ),
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              padding: EdgeInsets.only(
                left: Dimensions.widht20 * 2.5,
                right: Dimensions.widht20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      //  controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.filter_list_sharp),
                  ),
                  BigText(
                    text: " Short | Filters ",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font20,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.filter_alt_rounded),
                  )
                ],
              ))
        ]));
  }
}
