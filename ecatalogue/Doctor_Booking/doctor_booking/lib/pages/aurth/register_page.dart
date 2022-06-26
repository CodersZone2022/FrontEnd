import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
     // backgroundColor:AppColors.backgroundColor,
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
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius20 * 4,
                    backgroundImage: AssetImage("assets/image/logo_1.png"),
                  ),
                ),
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
                  icon: Icons.lock,isObscure: true,),
              SizedBox(
                height: Dimensions.height30,
              ),
              AppTextField(
                  textController: confirmPasswordController,
                  hintText: "Confirm Password",
                  icon: Icons.lock,isObscure: true),
              SizedBox(
                height: Dimensions.height30,
              ),
              AppTextField(
                  textController: nameController,
                  hintText: "Name",
                  icon: Icons.person),
              SizedBox(
                height: Dimensions.height30,
              ),
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height20 + Dimensions.height20,
              ),
              Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
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
                          RotateAnimatedText("Register", rotateOut: false)
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: Dimensions.height15,
              ),
              
              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                      text: "Have an account already?",
                      style: TextStyle(
                          color: AppColors.paraColor, fontSize: Dimensions.font20 )))
            ],
          ),
        ),
      ),
    );
  }
}
