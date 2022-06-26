import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_booking/pages/home_page.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/account_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? AppColors.titleColor : AppColors.backgroundColor0,
      appBar: _appBar(context),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.03,
          ),
          Container(
            height: Dimensions.screenHeight * 0.25,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: Dimensions.radius20 * 4,
                backgroundImage: AssetImage("assets/image/me2.png"),
              ),
            ),
          ),
          Center(
            child: Container(
              width: Dimensions.height45,
              height: Dimensions.height45,
              child: Icon(
                Icons.edit,
                size: Dimensions.iconSize24,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor1,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          AccountWidgets(
              icon: Icon(
                Icons.person,
                color: AppColors.iconColor3,
                size: Dimensions.iconSize24,
              ),
              text: Text(
                "Aarunya",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: AppColors.titleColor,
                ),
              )),
          SizedBox(
            height: Dimensions.height30,
          ),
          AccountWidgets(
              icon: Icon(
                Icons.email,
                color: AppColors.iconColor3,
                size: Dimensions.iconSize24,
              ),
              text: Text(
                "aarunya@outlook.in",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: AppColors.titleColor,
                ),
              )),
          SizedBox(
            height: Dimensions.height30,
          ),
          AccountWidgets(
              icon: Icon(
                Icons.phone,
                color: AppColors.iconColor3,
                size: Dimensions.iconSize24,
              ),
              text: Text(
                "xxxxxxxxxx",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: AppColors.titleColor,
                ),
              )),
          SizedBox(
            height: Dimensions.height30,
          ),
          AccountWidgets(
              icon: Icon(
                Icons.message,
                color: AppColors.yellowColor,
                size: Dimensions.iconSize24,
              ),
              text: Text(
                "Feedback",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: AppColors.titleColor,
                ),
              )),
          SizedBox(
            height: Dimensions.height30,
          ),
          AccountWidgets(
              icon: Icon(
                Icons.logout,
                color: AppColors.textwarning,
                size: Dimensions.iconSize24,
              ),
              text: Text(
                "LOGOUT",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: AppColors.textwarning,
                ),
              )),
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: InkWell(
        onTap: () {
          Get.to(() => const HomePage());
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: Dimensions.iconSize24,
        ),
      ),
      title: DefaultTextStyle(
          style: TextStyle(
              fontSize: Dimensions.font26,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          child: AnimatedTextKit(
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              TyperAnimatedText("Profile",
                  speed: const Duration(milliseconds: 100))
            ],
          )),
    );
  }
}
