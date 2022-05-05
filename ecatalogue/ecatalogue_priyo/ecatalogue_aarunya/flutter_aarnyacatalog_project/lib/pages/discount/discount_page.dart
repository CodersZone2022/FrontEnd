import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/pages/home/home_page.dart';
import 'package:flutter_aarnyacatalog_project/pages/wishlist/wishlist_history.dart';
import 'package:flutter_aarnyacatalog_project/routes/route_helper.dart';
import 'package:flutter_aarnyacatalog_project/utils/colors.dart';
import 'package:flutter_aarnyacatalog_project/utils/dimensions.dart';
import 'package:flutter_aarnyacatalog_project/widgets/big_text.dart';
import 'package:get/get.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("assets/data/info.json")
        .then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                BigText(
                  text: "Discounts",
                  size: Dimensions.font26,
                  color: AppColors.titleColor,
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    Get.to(() => HomePage());
                  },
                  child: Icon(
                    Icons.home,
                    size: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Dimensions.widht20,
                ),
                Icon(
                  Icons.notifications,
                  size: Dimensions.iconSize24,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                BigText(
                  text: "Top-Offers",
                  size: Dimensions.font20,
                  color: AppColors.mainBlackColor,
                ),
                Expanded(child: Container()),
                BigText(
                  text: "Details",
                  size: Dimensions.font20,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Dimensions.screenWidth,
              height: 200,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 / 2),
                    bottomRight: Radius.circular(Dimensions.radius20 / 2),
                    bottomLeft: Radius.circular(Dimensions.radius20 / 2),
                    topRight: Radius.circular(Dimensions.radius20 * 4),
                  ),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/banner.png")),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                    )
                  ]),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 220,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => WishlistHistory());
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                BigText(
                  text: "Tick Tick Deals",
                  size: Dimensions.font20,
                  color: AppColors.mainBlackColor,
                ),
                Expanded(child: Container()),
                BigText(
                  text: "Upcomming",
                  size: Dimensions.font20,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/banner_1.png")),
                          boxShadow: const [
                            BoxShadow(blurRadius: 40, offset: Offset(8, 10))
                          ]),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 270,
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => WishlistHistory());
                              },
                              child:  const Icon(
                                Icons.favorite,
                                color:Colors.white,
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 80, bottom: 90),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/clock.png")),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                BigText(
                  text: "cRaZy Deals",
                  size: Dimensions.font26,
                  color: AppColors.titleColor,
                ),
                Expanded(child: Container()),
                BigText(
                  text: "Viewall",
                  size: Dimensions.font20,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: Dimensions.iconSize24,
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2).toInt(),
                    itemBuilder: (_, i) {
                      int a = 2 * i;
                      int b = 2 * i + 1;

                      return Row(
                        children: [
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                  left: 30, bottom: 30, top: 15),
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(info[a]['img'])),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                    )
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 90,
                                  top: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children:  [
                                    InkWell(
                                    onTap: () {
                                Get.to(() => WishlistHistory());
                              },
                                      child:  Icon(
                                        Icons.favorite,
                                        color: AppColors.textwarning,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                  left: 30, bottom: 30, top: 15),
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(info[b]['img'])),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                    )
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 90,
                                  top: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children:  [
                                    InkWell(
                                      onTap: () {
                                Get.to(() => WishlistHistory());
                              },
                                      child:  Icon(
                                        Icons.favorite,
                                        color: AppColors.textwarning,
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
