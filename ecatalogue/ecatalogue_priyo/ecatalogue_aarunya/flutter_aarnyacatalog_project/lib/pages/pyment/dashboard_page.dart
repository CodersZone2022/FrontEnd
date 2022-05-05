

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aarnyacatalog_project/utils/colors.dart';
import 'package:flutter_aarnyacatalog_project/utils/dimensions.dart';
import 'package:flutter_aarnyacatalog_project/widgets/big_text.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
 // Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Payment",
            size: 24,
            color: Colors.white,
          ),
        
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.height20 * 14,
              margin: EdgeInsets.only(
                  left: Dimensions.widht20, right: Dimensions.widht20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/payments.png"))),
            ),
            GestureDetector(  
              onTap: () async {
              //  await makePayment();
              },
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height20 * 5,
                margin: EdgeInsets.only(
                    left: Dimensions.widht20, right: Dimensions.widht20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Center(
                    child: BigText(
                  text: "Make payment",
                  color: Colors.white,
                  size: Dimensions.font26,
                )),
              ),
            ),
          ]),
        ));
  }

  // Future<void> makePayment() async {
  //   try {
  //     paymentIntentData = await createPaymentIntet('20', 'USD');
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //       paymentIntentClientSecret: paymentIntentData!['client_secret'],
  //       applePay: true,
  //       googlePay: true,
  //       style: ThemeMode.light,
  //       merchantCountryCode: 'India',
   //        merchantDisplayName: 'Aarunya'
  //     ));
  //     displayPaymentShee();
  //   } catch (e) {
  //     print('exception' + e.toString());
  //   }
  // } 

  // displayPaymentShee() async {
  //   try {
  //    await Stripe.instance.presentPaymentSheet(
  //         parameters: PresentPaymentSheetParameters(
  //       clientSecret: paymentIntentData!['client_secret'],
  //       confirmPayment: true,
  //     ));
  //     setState(() {
  //       paymentIntentData = null;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Paid successfully")));
  //   } on StripeException catch (e) {
  //     print(e.toString());
  //     showDialog(
  //     context: context, 
  //     builder: (_)=>AlertDialog(
  //       content:Text("Cancelled"),
  //     ));
  //   }
  // }

  // createPaymentIntet(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'Card'
  //     };
  //     var response = await http.post(
  //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //         body: body,
  //         headers: {
  //           'Authorization':
  //               'Bearer sk_test_51KutPMSCWDFyhtjfMaMdkGNwrfFjtctz2qVjKiwpc4RTBW21lHWtKts23O3XlXDvfWsCl0tK4MWebvpN8oSEtO3e003PLg1mAZ ',
  //           'Content-Type': 'application/x-www-from-urlencoded'
  //         });
  //     return jsonDecode(response.body.toString());
  //   } catch (e) {
  //     print('exception' + e.toString());
  //   }
  // }

  // calculateAmount(String amount) {
  //   final price = int.parse(amount) * 100;
  //   return price.toString();
  // }
}
