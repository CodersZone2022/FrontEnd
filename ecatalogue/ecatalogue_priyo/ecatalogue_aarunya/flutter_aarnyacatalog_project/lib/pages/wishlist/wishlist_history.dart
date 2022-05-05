import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/base/no_data_page.dart';
import 'package:flutter_aarnyacatalog_project/controllers/recommended_product_controller.dart';
import 'package:flutter_aarnyacatalog_project/pages/home/home_page.dart';
import 'package:flutter_aarnyacatalog_project/routes/route_helper.dart';
import 'package:flutter_aarnyacatalog_project/utils/app_constants.dart';
import 'package:flutter_aarnyacatalog_project/utils/colors.dart';
import 'package:flutter_aarnyacatalog_project/utils/dimensions.dart';
import 'package:flutter_aarnyacatalog_project/widgets/app_icon.dart';
import 'package:flutter_aarnyacatalog_project/widgets/big_text.dart';
import 'package:flutter_aarnyacatalog_project/widgets/icon_and_text_widget.dart';
import 'package:flutter_aarnyacatalog_project/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class WishlistHistory extends StatelessWidget {
  const WishlistHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Dimensions.height10 * 10,
              color: AppColors.mainColor,
              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.height45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(
                    text: "Wishlist History",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: Dimensions.widht20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      backgroundColor: AppColors.yellowColor,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.widht20 * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      backgroundColor: AppColors.yellowColor,
                    ),
                  )
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
                                          Wrap(
                                            children: List.generate(
                                                5,
                                                (index) => Icon(
                                                      Icons.star,
                                                      color:
                                                          AppColors.mainColor,
                                                      size: 15,
                                                    )),
                                          ),
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
                  : SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(
                        child: NoDataPage(
                          text: "There are no items in this !",
                          imgPath: "assets/images/empty_box.png",
                        ),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
