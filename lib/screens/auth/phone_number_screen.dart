import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/authController/firebase_auth_controller.dart';
import 'package:fashion_dx/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer<FirebaseAuthController>(
              builder: (context, firebaseAuthController, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (MediaQuery.of(context).size.height * .05).heightBox,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Card(
                    color: AppColors.white,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                (MediaQuery.of(context).size.height * .07).heightBox,
                Text(
                  "Phone number",
                  style: KTextStyle.k_25,
                ),
                (MediaQuery.of(context).size.height * .03).heightBox,
                Text(
                  "Enter your 10 digit Mobile number we will send you a six digit code",
                  style: KTextStyle.k_16.copyWith(fontWeight: FontWeight.w400),
                ),
                (MediaQuery.of(context).size.height * .07).heightBox,
                KTextFormField(
                    hintText: "number",
                    labelText: "number",
                    controller: phoneNoController,
                    validator: (a) {
                      if (phoneNoController.text.isEmpty) {
                        return "enter number";
                      }
                      return null;
                    }),
                (MediaQuery.of(context).size.height * .07).heightBox,
                Center(
                    child: FlexibleButton(
                        btnColor: AppColors.buttonColor,
                        title: "OTP",
                        onPress: () {
                          debugPrint("????????????????????trigger");
                          firebaseAuthController.phoneNumberLogin(
                              phoneNoController.text, context);
                        }))
              ],
            );
          }),
        ),
      ),
    );
  }
}
