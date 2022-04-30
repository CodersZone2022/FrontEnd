import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/base/custom_loader.dart';
import 'package:flutter_aarnyacatalog_project/base/show_custom_snackbar.dart';
import 'package:flutter_aarnyacatalog_project/controllers/auth_controller.dart';
import 'package:flutter_aarnyacatalog_project/models/signup_body_model.dart';
import 'package:flutter_aarnyacatalog_project/routes/route_helper.dart';
import 'package:flutter_aarnyacatalog_project/utils/colors.dart';
import 'package:flutter_aarnyacatalog_project/utils/dimensions.dart';
import 'package:flutter_aarnyacatalog_project/widgets/app_text_field.dart';
import 'package:flutter_aarnyacatalog_project/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var contuctController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String contuct = contuctController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        ShowCustomSnackBar("Type in your name", title: "Name");
      } else if (contuct.isEmpty) {
        ShowCustomSnackBar("Type in your contuct number",
            title: "Contuct number");
      } else if (email.isEmpty) {
        ShowCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        ShowCustomSnackBar("Type in a valid email address",
            title: "Email address");
      } else if (password.isEmpty) {
        ShowCustomSnackBar("Type in your password", title: "password");
      } else if (password.length < 6) {
        ShowCustomSnackBar("Password can not less than six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, contuct: contuct, email: email, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            ShowCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //applogo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimensions.radius20 * 4,
                            backgroundImage:
                                AssetImage("assets/images/logo3.png"),
                          ),
                        ),
                      ),
                      //Your email
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          iconData: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Your Passwords
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        iconData: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Your name
                      AppTextField(
                          textController: nameController,
                          hintText: "Name",
                          iconData: Icons.person),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Your contuct
                      AppTextField(
                          textController: contuctController,
                          hintText: "Contucts",
                          iconData: Icons.phone),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //sign up button
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign up",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //tag line
                      RichText(
                          text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                              text: "Have an account already?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20))),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign up options
                      RichText(
                          text: TextSpan(
                              text:
                                  "Sign up using one of the following methods",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font16))),
                      Wrap(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: Dimensions.radius30,
                                    backgroundImage: AssetImage(
                                        "assets/images/" + signUpImages[index]),
                                  ),
                                )),
                      )
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
