import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_booking/pages/aurth/otp_page.dart';
import 'package:doctor_booking/pages/aurth/sign_in_page.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetAccountPage extends StatelessWidget {
  const ForgetAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    var phoneController = TextEditingController();
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      body: Container(
        height: Dimensions.screenHeight,
        decoration: BoxDecoration(
          gradient: AppColors.backgroundColor3,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              Container(
                  margin: EdgeInsets.only(left: Dimensions.widht20),
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => SignInPage());
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: Dimensions.iconSize24,
                          ),
                        ),
                      ])),
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius20 * 4,
                    backgroundImage:
                        AssetImage("assets/image/forgot_password1.png"),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(left: Dimensions.widht20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(
                            fontSize: Dimensions.font20 * 2,
                            color: AppColors.mainBlackColor,
                            fontWeight: FontWeight.bold),
                        child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TyperAnimatedText("Forget Password",
                                speed: const Duration(milliseconds: 100))
                          ],
                        )),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.02,
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
                            TyperAnimatedText("Please enter your Phone no.",
                                speed: const Duration(milliseconds: 100)),
                            TyperAnimatedText("to recived a verification code",
                                speed: const Duration(milliseconds: 100))
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height20 + Dimensions.height30,
              ),
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.screenHeight * 0.20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => OtpPage());
                },
                child: Container(
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
                            RotateAnimatedText("Send", rotateOut: false)
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
