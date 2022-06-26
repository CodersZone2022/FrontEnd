import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_booking/pages/aurth/forget_account_page.dart';
import 'package:doctor_booking/pages/aurth/register_page.dart';
import 'package:doctor_booking/pages/aurth/sign_in_page.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class CreatNewPassword extends StatelessWidget {
  const CreatNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newPasswordController = TextEditingController();
    var confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage("assets/image/forgot_password1.png"))),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.widht20,
              right: Dimensions.widht20,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => SignInPage());
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: Dimensions.iconSize24,
                      color: AppColors.mainBlackColor,
                    ),
                  )
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: -25,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.widht20,
                    right: Dimensions.widht20,
                    top: Dimensions.height20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                     gradient: AppColors.backgroundColor3,),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.03,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.widht20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: Dimensions.font26,
                                    color: AppColors.mainBlackColor,
                                    fontWeight: FontWeight.bold),
                                child: AnimatedTextKit(
                                  repeatForever: false,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText("Create New Password",
                                        speed:
                                            const Duration(milliseconds: 100))
                                  ],
                                )),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.05,
                            ),
                            DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: AppColors.paraColor,
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: false,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                        "New Password must be different",
                                        speed:
                                            const Duration(milliseconds: 100)),
                                    TyperAnimatedText(
                                        "form previously used password",
                                        speed:
                                            const Duration(milliseconds: 100))
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      AppTextField(
                        textController: newPasswordController,
                        hintText: "New Password",
                        icon: Icons.lock,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      AppTextField(
                        textController: confirmPasswordController,
                        hintText: "Confirm Password",
                        icon: Icons.lock,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor1,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(1, 10),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: Dimensions.font26,
                                  color: AppColors.buttonBackgroundColor,
                                  fontWeight: FontWeight.bold),
                              child: AnimatedTextKit(
                                repeatForever: false,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  RotateAnimatedText("Reset", rotateOut: false)
                                ],
                              ),
                            ),
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
