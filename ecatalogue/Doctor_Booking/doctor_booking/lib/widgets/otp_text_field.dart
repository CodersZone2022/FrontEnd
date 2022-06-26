import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:flutter/material.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
 

 OtpTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(left: Dimensions.widht20),
      width: Dimensions.height45,
      height: Dimensions.height45,
      decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(   
        controller: textController,
        decoration: InputDecoration(
            hintText: hintText,
            
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
            )),
      ),
    );
  }
}
