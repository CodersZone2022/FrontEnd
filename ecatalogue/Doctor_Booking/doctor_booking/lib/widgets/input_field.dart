import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
              height: Dimensions.height30 + Dimensions.height20,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey : Colors.white,
                  border: Border.all(
                      color:Get.isDarkMode ? Colors.grey : Colors.white,
                      width: 1.2),
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 7,
                        offset: Offset(1, 10),
                        blurRadius: 10,
                       color: Colors.grey.withOpacity(0.2)
                        )
                  ]),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    autofocus: false,
                    cursorColor:
                        Get.isDarkMode ? Colors.black : Colors.grey[700],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                   
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Get.isDarkMode ? Colors.grey : Colors.white, width: 0)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Get.isDarkMode ? Colors.grey : Colors.white, width: 0)),
                    ),
                  )),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        )
                ],
              ))
        ],
      ),
    );
  }
}
