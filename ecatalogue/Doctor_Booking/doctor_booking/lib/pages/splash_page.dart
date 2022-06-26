import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              height: Dimensions.screenHeight,
              child: Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/blue_Background2.png"))),
              )),
          Positioned(
              top: Dimensions.height30*18,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 25,
                    child: DefaultTextStyle(
                         style: TextStyle(
                        fontSize: Dimensions.font26,
                        color:AppColors.titleColor,
                        fontWeight: FontWeight.w600),
                  
                      child: AnimatedTextKit(
                        repeatForever: false,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText( "24 X 7 Our Service",
                           speed: const Duration(milliseconds: 100)
                          )
                        ],)
                    ),
                  ),
                  
                  
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 25,
                    child: DefaultTextStyle(
                       style: TextStyle(
                          fontSize: Dimensions.font20,
                          color: AppColors.paraColor,
                        ),
                      child: AnimatedTextKit(
                        repeatForever: false,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText( "Talk to doctor's from everywhere.",
                          speed: const Duration(milliseconds: 100)
                          )
                        ],)
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height45,
                  ),
                  Container(
                    width: 200,
                    height: Dimensions.height30 * 2,
                    // decoration: BoxDecoration(
                    //     borderRadius:
                    //         BorderRadius.circular(Dimensions.radius20),
                    //     color: AppColors.yellowColor),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: AppColors.mainColor1,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                          )),
                      onPressed: () {
                        Get.toNamed(RouteHelper.getSignInPage());
                      },
                      child: Text(
                        "Get started",
                        style: TextStyle(
                            color: Colors.white, fontSize: Dimensions.font20,fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
