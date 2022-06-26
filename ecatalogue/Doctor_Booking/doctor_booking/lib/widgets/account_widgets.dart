import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AccountWidgets extends StatelessWidget {
  Icon icon;
  Text text;
  AccountWidgets({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.widht20, right: Dimensions.widht20),
      padding: EdgeInsets.only(
          left: Dimensions.widht20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: Dimensions.widht20,
          ),
          text
        ],
      ),
      decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
    );
  }
}
