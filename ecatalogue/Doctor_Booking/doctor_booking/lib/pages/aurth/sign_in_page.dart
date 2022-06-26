import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_booking/pages/aurth/forget_account_page.dart';
import 'package:doctor_booking/pages/aurth/register_page.dart';
import 'package:doctor_booking/pages/home_page.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      //backgroundColor: AppColors.backgroundColor,
      body:
          //for gradient color
          Container(
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
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius20 * 4,
                    backgroundImage: AssetImage("assets/image/logo_1.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Dimensions.widht20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                        
                        style: TextStyle(
                            fontSize:
                                Dimensions.font20 * 3 + Dimensions.font20 / 2,
                            color: AppColors.mainBlackColor,
                            fontWeight: FontWeight.bold),
                        child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TyperAnimatedText("Welcome",
                                speed: const Duration(milliseconds: 100))
                          ],
                        )),
                    DefaultTextStyle(
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                          color: AppColors.paraColor,
                        ),
                        child: AnimatedTextKit(
                          // repeatForever: false,
                          // totalRepeatCount: 1,
                          animatedTexts: [
                            TyperAnimatedText(
                                "Talk to doctor's from everywhere.",
                                speed: const Duration(milliseconds: 100))
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height30,
              ),
              AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.lock_open,
                isObscure: true,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => ForgetAccountPage(),
                                transition: Transition.fade),
                          text: "Forget your Password",
                          style: TextStyle(
                              color: AppColors.paraColor,
                              fontSize: Dimensions.font20))),
                  SizedBox(
                    width: Dimensions.widht20,
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => HomePage());
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
                            RotateAnimatedText("Sign in", rotateOut: false)
                          ],
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don\'t an account?",
                      style: TextStyle(
                          color: AppColors.paraColor,
                          fontSize: Dimensions.font20),
                      children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => RegisterPage(),
                            transition: Transition.fade),
                      text: " Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font20),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
