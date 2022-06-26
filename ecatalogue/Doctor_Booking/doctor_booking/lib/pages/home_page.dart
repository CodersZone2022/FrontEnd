import 'package:doctor_booking/pages/account/account_page.dart';
import 'package:doctor_booking/routes/routes_helper.dart';
import 'package:doctor_booking/theme/notification_services.dart';
import 'package:doctor_booking/theme/theme.dart';
import 'package:doctor_booking/theme/theme_services.dart';
import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/utils/dimensions.dart';
import 'package:doctor_booking/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  String _selectedchember = "";
  var chember = {
    'Nurologist': '1',
    'Orthopadish': '2',
    'Medicinspacilist': '3',
    'Cardiologist': '4',
    'Ginocologist': '5',
    'Dermotologist':'6',
    'Childspacilist':'7',
  };

  List _chembers = [];
  chemberDependentDropDown() {
    chember.forEach((key, value) {
      _chembers.add(key);
    });
    _selectedchember = _chembers[0];
  }

  String _selecteddoctor = "";
  var doctor = {
    'Dr.K.Kormoker': '1',
    'Dr.Md Roffic': '2',
    'Dr.Raja Pual': '3',
    'Dr.Balaji': '4',
    'Dr.naga': '5',
    'Dr.Moanash': '6',
    'Dr.das': '7',
    'Dr.laxmikant': '1',
    'Dr.Ghoseh': '2',
    'Dr.mondal': '3',
    'Dr.T.K.Kor': '4',
    'Dr.rohitsen': '5',
    'Dr.Md Deshmukh': '6',
    'Dr.Md Niraj': '7',
    'Dr.Md Aarunya': '1',
    'Dr.Md Laxmi': '2',
    'Dr.Adak': '3',
    'Dr.Saumadeep': '4',
    'Dr.Riya': '5',
    'Dr.Bage': '6',
    'Dr.Mallik': '7',
  };

  List _doctors = [];
  doctorDependentDropDown(chemberShortName) {
    doctor.forEach((key, value) {
      if (chemberShortName == value) {
        _doctors.add(key);
      }
    });
    _selecteddoctor = _doctors[0];
  }

  String _selecteddepartment = "";
  var department = {
  'C.T.Point':'Dr.K.Kormoker',
  'SamantoMedical':'Dr.K.Kormoker',
  'BluePrint':'Dr.K.Kormoker',
  'Redhakrishna-medical':'Dr.K.Kormoker',
  'Desha':'Dr.K.Kormoker',
 
  };

  List _departments = [];
  departmentDependentDropDown(doctorShortName) {
    department.forEach((key, value) {
      if (doctorShortName == value) {
        _departments.add(key);
      }
    });
    _selecteddepartment = _departments[0];
  }

  // List<dynamic> chembers = [];
  // List<dynamic> doctorMasters = [];
  // List<dynamic> doctors = [];
  // List<dynamic> departments = [];
  // List<dynamic> schedules = [];

  // String? chemberId;
  // String? doctorId;
  // String? departmentId;
  //   String? scheduleId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    chemberDependentDropDown();

    // this.chembers.add({"id": 1, "name": "C.T.Point"});
    // this.chembers.add({"id": 2, "name": "SamantoMedical"});
    // this.chembers.add({"id": 3, "name": "BluePrint"});
    // this.chembers.add({"id": 4, "name": "Redhakrishna-medical"});
    // this.chembers.add({"id": 5, "name": "Desha"});

    // this.doctorMasters = [
    //   {"ID": 1, "Name": "Dr.K.Kormoker", "ParentId": 1},
    //   {"ID": 2, "Name": "Dr.Md Roffic", "ParentId": 1},
    //   {"ID": 3, "Name": "Dr.Raja Pual", "ParentId": 1},
    //   {"ID": 4, "Name": "Dr.Balaji", "ParentId": 1},
    //   {"ID": 1, "Name": "Dr.naga", "ParentId": 2},
    //   {"ID": 2, "Name": "Dr.Moanash", "ParentId": 2},
    //   {"ID": 3, "Name": "Dr.das", "ParentId": 2},
    //   {"ID": 4, "Name": "Dr.laxmikant", "ParentId": 2},
    //   {"ID": 1, "Name": "Dr.Ghoseh", "ParentId": 3},
    //   {"ID": 2, "Name": "Dr.mondal", "ParentId": 3},
    //   {"ID": 3, "Name": "Dr.T.K.Kor", "ParentId": 3},
    //   {"ID": 4, "Name": "Dr.rohitsen", "PaarentId": 3},
    //   {"ID": 1, "Name": "Dr.Md Deshmukh", "ParentId": 4},
    //   {"ID": 2, "Name": "Dr.Md Niraj", "ParentId": 4},
    //   {"ID": 3, "Name": "Dr.Md Aarunya", "ParentId": 4},
    //   {"ID": 4, "Name": "Dr.Md Laxmi", "ParentId": 4},
    //   {"ID": 1, "Name": "Dr.Adak", "ParentId": 5},
    //   {"ID": 2, "Name": "Dr.Saumadeep", "ParentId": 5},
    //   {"ID": 3, "Name": "Dr.Riya", "ParentId": 5},
    //   {"ID": 4, "Name": "Dr.Bage", "ParentId": 5},
    // ];

    // this.departments.add({"id": 1, "name": "Nurologist"});
    // this.departments.add({"id": 2, "name": "Orthopadish"});
    // this.departments.add({"id": 3, "name": "Ginocologist"});
    // this.departments.add({"id": 4, "name": "Medicinspacilist"});
    // this.departments.add({"id": 5, "name": "Childspacilist"});

    // this.schedules.add({"id": 1, "name": "11:00A.M-2:00P.M"});
    // this.schedules.add({"id": 2, "name": "4:00P.M-7:00P.M"});
  }

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   notifyHelper = NotifyHelper();
  //   notifyHelper.initializeNotification();
  //   notifyHelper.requestIOSPermissions();
  // }

  // String _selectedDepartment = "none";
  // List<String> departmentList = ["Gino", "Child", "Ortho", "Medicen", "Nuro"];

  // String _selectedDoctor = "none";
  // List<String> doctorList = [
  //   "Dr.Md Roffic",
  //   "Dr.T.K.Kor",
  //   "Dr.Sumonta Panja",
  //   "Dr.Raja Pual",
  //   "Dr.K.Kormoker",
  //   "Dr.kor",
  //   "Dr.naga",
  //   "Dr.Ghoseh",
  //   "Dr.laxmikant",
  //   "Dr.Balaji",
  //   "Dr.kd.jana",
  //   "Dr.Moanash",
  //   "Dr.das",
  //   "Dr.mondal",
  //   "Dr.rohit",
  //   "Dr.Md Roffic",
  //   "Dr.T.K.Kor",
  //   "Dr.Sumonta Panja",
  //   "Dr.Raja Pual",
  //   "Dr.K.Kormoker",
  //   "Dr.kor",
  //   "Dr.naga",
  //   "Dr.Ghoseh",
  //   "Dr.laxmikant",
  //   "Dr.Balaji",
  //   "Dr.kd.jana",
  //   "Dr.Moanash",
  //   "Dr.das",
  //   "Dr.mondal",
  //   "Dr.rohit",
  // ];

  // String _selectedChember = "none";
  // List<String> chemberList = [
  //   "Mondalfermasi",
  //   "C.T.Point",
  //   "SamantoMedical",
  //   "DeshaMedical",
  //   "BluePrint"
  // ];

  // String _selectedSchedule = "none";
  // List<String> scheduleList = [
  //   "11:00A.M-2:00P.M",
  //   "4:00P.M-7:00P.M",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Get.isDarkMode ? AppColors.titleColor : AppColors.backgroundColor0,
        appBar: _appBar(context),
        body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height20),
                  Text(
                    "Fill the details",
                    style: headingStyle,
                  ),
                  SizedBox(height: Dimensions.height30),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 23,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "chember",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Container(
                          width: 400,
                          child: DropdownButton(
                            value: _selectedchember,
                            onChanged: (newValue) {
                              setState(() {
                                _departments = [];
                                _doctors = [];
                                doctorDependentDropDown(chember[newValue]);
                                _selectedchember = "$newValue";
                              });
                            },
                            items: _chembers.map((chember) {
                              return DropdownMenuItem(
                                child: new Text(chember),
                                value: chember,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "doctor",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        Container(
                          width: 400,
                          child: DropdownButton(
                            value: _selecteddoctor,
                            onChanged: (newValue) {
                              print(newValue);
                              setState(() {
                                print(newValue);
                                _departments = [];
                                departmentDependentDropDown(newValue);

                                _selecteddoctor = "$newValue";
                              });
                            },
                            items: _doctors.map((doctor) {
                              return DropdownMenuItem(
                                child: new Text(doctor),
                                value: doctor,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "department",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        Container(
                          width: 400,
                          child: DropdownButton(
                            value: _selecteddepartment,
                            onChanged: (newValue) {
                              setState(() {
                                _selecteddepartment = "$newValue";
                              });
                            },
                            items: _departments.map((department) {
                              return DropdownMenuItem(
                                child: new Text(department),
                                value: department,
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),

                  // FormHelper.dropDownWidgetWithLabel(
                  //   context,
                  //   "Chember",
                  //   "Select Chember",
                  //   this.chemberId,
                  //   this.chembers,
                  //   (onChangedVal) {
                  //     this.chemberId = onChangedVal;
                  //     // print("selected chember:$onChangedVal");
                  //     this.doctors = this
                  //         .doctorMasters
                  //         .where(
                  //           (stateItems) =>
                  //               stateItems["ParentId"].toString() ==
                  //               onChangedVal.toString(),
                  //         )
                  //         .toList();
                  //     this.doctorId = null;
                  //   },
                  //   (onValidateVal) {
                  //     if (onValidateVal == null) {
                  //       return 'Please Select Chember';
                  //     }
                  //     return null;
                  //   },
                  //   borderColor: Theme.of(context).primaryColor,
                  //   borderWidth: 1.5,
                  //   paddingBottom: 20,
                  //   paddingLeft: 10,
                  //   paddingRight: 10,
                  //   paddingTop: 20,
                  //   borderFocusColor: Theme.of(context).primaryColor,
                  //   borderRadius: Dimensions.radius15,
                  //   textColor: Get.isDarkMode ? Colors.white : Colors.grey,
                  //   // optionValue: "Id",
                  //   // optionLabel: "name",
                  // ),

                  // FormHelper.dropDownWidgetWithLabel(
                  //   context,
                  //   "Doctor",
                  //   "Select Doctor's",
                  //   this.doctorId,
                  //   this.doctors,
                  //   (onChangedVal) {
                  //     this.doctorId = onChangedVal;
                  //     print("Selected Doctor:$onChangedVal");
                  //   },
                  //   (onValidate) {
                  //     return null;
                  //   },
                  //   borderColor: Theme.of(context).primaryColor,
                  //   borderWidth: 1.5,
                  //   paddingBottom: 20,
                  //   paddingLeft: 10,
                  //   paddingRight: 10,
                  //   paddingTop: 20,
                  //   borderFocusColor:Theme.of(context).primaryColor,
                  //   borderRadius: Dimensions.radius15,
                  //   textColor: Get.isDarkMode ? Colors.white : Colors.grey,
                  //   optionValue: "ID",
                  //   optionLabel: "Name",
                  // ),
                  // FormHelper.dropDownWidgetWithLabel(
                  //     context,
                  //     "Department",
                  //     "Select Department",
                  //     this.departmentId,
                  //     this.departments, (onChangedVal) {
                  //   this.departmentId = onChangedVal;
                  // },
                  //  (onValidate){
                  //    return null;
                  //  },
                  //  borderColor:Theme.of(context).primaryColor,
                  //   borderWidth: 1.5,
                  //   paddingBottom: 20,
                  //   paddingLeft: 10,
                  //   paddingRight: 10,
                  //   paddingTop: 20,
                  //   borderFocusColor:Theme.of(context).primaryColor,
                  //   borderRadius: Dimensions.radius15,
                  //   textColor: Get.isDarkMode ? Colors.white : Colors.grey,

                  //  ),

                  //  FormHelper.dropDownWidgetWithLabel(
                  //     context,
                  //     "Schedule",
                  //     "Select Schedule",
                  //     this.scheduleId,
                  //     this.schedules, (onChangedVal) {
                  //   this.scheduleId = onChangedVal;
                  // },
                  //  (onValidate){
                  //    return null;
                  //  },
                  //  borderColor:Theme.of(context).primaryColor,
                  //   borderWidth: 1.5,
                  //   paddingBottom: 20,
                  //   paddingLeft: 10,
                  //   paddingRight: 10,
                  //   paddingTop: 20,
                  //   borderFocusColor: Theme.of(context).primaryColor,
                  //   borderRadius: Dimensions.radius15,
                  //   textColor: Get.isDarkMode ? Colors.white : Colors.grey,

                  //  ),

                  // MyInputField(
                  //   title: "Department Name",
                  //   hint: "$_selectedDepartment",
                  //   widget: Expanded(
                  //     child: Center(
                  //       child: Container(
                  //        width: MediaQuery.of(context).size.width,
                  //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(Dimensions.radius15),
                  //             border: Border.all(color:Get.isDarkMode ? Colors.grey : Colors.white, width: 1.0)),
                  //         child: DropdownButton(
                  //           isExpanded: true,
                  //           icon: Icon(
                  //             Icons.keyboard_arrow_down,
                  //             color: AppColors.mainBlackColor,
                  //           ),
                  //           iconSize: Dimensions.iconSize24,
                  //           elevation: 4,
                  //           style: subTitleStyle,
                  //           underline: Container(height: 0),
                  //           onChanged: (String? newValue) {
                  //             setState(() {
                  //               _selectedDepartment = newValue!;
                  //             });
                  //           },
                  //           items: departmentList
                  //               .map<DropdownMenuItem<String>>((String? value) {
                  //             return DropdownMenuItem<String>(
                  //               value: value,
                  //               child: Text(
                  //                 value!,
                  //                 style: TextStyle(
                  //                   color: Get.isDarkMode ? Colors.white : Colors.black,
                  //                 ),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: Dimensions.height30),
                  // MyInputField(
                  //   title: "Doctor's Name",
                  //   hint: "$_selectedDoctor",
                  //   widget: Expanded(
                  //     child: Center(
                  //       child: Container(
                  //        width: MediaQuery.of(context).size.width,
                  //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(Dimensions.radius15),
                  //             border: Border.all(color:Get.isDarkMode ? Colors.grey : Colors.white, width: 1.0)),
                  //         child: DropdownButton(
                  //           isExpanded: true,
                  //           icon: Icon(
                  //             Icons.keyboard_arrow_down,
                  //             color: AppColors.mainBlackColor,
                  //           ),
                  //           iconSize: Dimensions.iconSize24,
                  //           elevation: 4,
                  //           style: subTitleStyle,
                  //           underline: Container(height: 0),
                  //           onChanged: (String? newValue) {
                  //             setState(() {
                  //               _selectedDoctor = newValue!;
                  //             });
                  //           },
                  //           items: doctorList
                  //               .map<DropdownMenuItem<String>>((String? value) {
                  //             return DropdownMenuItem<String>(
                  //               value: value,
                  //               child: Text(
                  //                 value!,
                  //                 style: TextStyle(
                  //                   color: Get.isDarkMode ? Colors.white : Colors.black,
                  //                 ),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: Dimensions.height30),
                  //  MyInputField(
                  //   title: "Available chember",
                  //   hint: "$_selectedChember",
                  //   widget: Expanded(
                  //     child: Center(
                  //       child: Container(
                  //        width: MediaQuery.of(context).size.width,
                  //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(Dimensions.radius15),
                  //             border: Border.all(color: Get.isDarkMode ? Colors.grey : Colors.white, width: 1.0)),
                  //         child: DropdownButton(
                  //           isExpanded: true,
                  //           icon: Icon(
                  //             Icons.keyboard_arrow_down,
                  //             color: AppColors.mainBlackColor,
                  //           ),
                  //           iconSize: Dimensions.iconSize24,
                  //           elevation: 4,
                  //           style: subTitleStyle,
                  //           underline: Container(height: 0),
                  //           onChanged: (String? newValue) {
                  //             setState(() {
                  //               _selectedChember = newValue!;
                  //             });
                  //           },
                  //           items: chemberList
                  //               .map<DropdownMenuItem<String>>((String? value) {
                  //             return DropdownMenuItem<String>(
                  //               value: value,
                  //               child: Text(
                  //                 value!,
                  //                 style: TextStyle(
                  //                   color: Get.isDarkMode ? Colors.white : Colors.black,
                  //                 ),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: Dimensions.height30),
                  // MyInputField(
                  //   title: "Select Schedule",
                  //   hint: "$_selectedSchedule",
                  //   widget: Expanded(
                  //     child: Center(

                  //       child: Container(

                  //        width: MediaQuery.of(context).size.width,
                  //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(Dimensions.radius15),
                  //             border: Border.all(color:Get.isDarkMode ? Colors.grey : Colors.white, width: 1.0)),
                  //         child: DropdownButton(

                  //           isExpanded: true,
                  //           icon: Icon(
                  //             Icons.keyboard_arrow_down,
                  //             color: AppColors.mainBlackColor,
                  //           ),
                  //           iconSize: Dimensions.iconSize24,
                  //           elevation: 4,
                  //           style: subTitleStyle,
                  //           underline: Container(height: 0),
                  //           onChanged: (String? newValue) {
                  //             setState(() {
                  //               _selectedSchedule = newValue!;
                  //             });
                  //           },
                  //           items: scheduleList
                  //               .map<DropdownMenuItem<String>>((String? value) {
                  //             return DropdownMenuItem<String>(
                  //               value: value,
                  //               child: Text(
                  //                 value!,
                  //                 style: TextStyle(
                  //                   color: Get.isDarkMode ? Colors.white : Colors.black,
                  //                 ),
                  //               ),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.05,
                  ),
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
                      onPressed: () {
                        Get.toNamed(RouteHelper.getDoctorBookingPage());
                      },
                      child: Text(
                        "Check",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.font20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme");

          // notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: Dimensions.iconSize24,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => AccountPage());
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/image/me2.png"),
          ),
        ),
        SizedBox(
          width: Dimensions.widht20,
        )
      ],
    );
  }
}
