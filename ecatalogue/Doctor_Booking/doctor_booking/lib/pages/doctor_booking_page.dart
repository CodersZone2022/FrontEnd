import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/theme/theme_services.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorBookingPage extends StatefulWidget {
  const DoctorBookingPage({Key? key}) : super(key: key);

  @override
  State<DoctorBookingPage> createState() => _DoctorBookingPageState();
}

class _DoctorBookingPageState extends State<DoctorBookingPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedGender = "none";
  List<String> genderList = [
    "Male",
    "Female",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Get.isDarkMode
                  ? AppColors.titleColor
                  : AppColors.backgroundColor0,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: Dimensions.height20),
              Text(
                "Fill your's details",
                style: headingStyle,
              ),
              MyInputField(title: "Name", hint: "Enter your name",controller: _titleController,),
               SizedBox(height: Dimensions.height30),
               MyInputField(
                title: "Select Gender",
                hint: "$_selectedGender",
                widget: Expanded(
                  child: Center(
                    
                    child: Container(
                      
                     width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          border: Border.all(color:Get.isDarkMode ? Colors.grey : Colors.white, width: 1.0)),
                      child: DropdownButton(
                        
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.mainBlackColor,
                        ),
                        iconSize: Dimensions.iconSize24,
                        elevation: 4,
                        style: subTitleStyle,
                        underline: Container(height: 0),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue!;
                          });
                        },
                        items: genderList
                            .map<DropdownMenuItem<String>>((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value!,
                              style: TextStyle(
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(height: Dimensions.height30),
              MyInputField(
                title: "Date of Birth",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.mainBlackColor,
                  ),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
               SizedBox(height: Dimensions.height30),
              MyInputField(title: "Contact No.", hint: "Enter your mobile no."),
              SizedBox(height: Dimensions.height45*2),
              Container(
                width: 200,
                height: Dimensions.height30 * 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: AppColors.mainColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                      )),
                  onPressed: ()=>_validateData(),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                       color: Colors.white , fontSize: Dimensions.font20,fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      //add to database
      Get.offNamed(RouteHelper.getInitial());
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required !",
      
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:Colors.white,
      colorText:  AppColors.textwarning,
      
      icon: Icon(Icons.warning_amber_rounded,color: AppColors.textwarning,)
      );
    }
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.offNamed(RouteHelper.getInitial());
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: Dimensions.iconSize24,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/image/me2.png"),
        ),
        SizedBox(
          width: Dimensions.widht20,
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime(2122));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("it's null or something is wrong");
    }
  }
}
