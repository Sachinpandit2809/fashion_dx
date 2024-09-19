import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/auth/login_screen.dart';
import 'package:fashion_dx/screens/auth/varification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController forgotPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
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
                "Forgot Password?",
                style: KTextStyle.k_25,
              ),
              (MediaQuery.of(context).size.height * .03).heightBox,
              Text(
                "Enter email associated with your account and we will send an email with instruction to reset your password",
                style: KTextStyle.k_16.copyWith(fontWeight: FontWeight.w400),
              ),
              (MediaQuery.of(context).size.height * .07).heightBox,
              KTextFormField(
                  hintText: "email",
                  labelText: "email",
                  controller: forgotPassController,
                  validator: (a) {
                    if (forgotPassController.text.isEmpty) {
                      return "enter email";
                    }
                    return null;
                  }),
              (MediaQuery.of(context).size.height * .07).heightBox,
              Center(
                  child: FlexibleButton(
                      btnColor: AppColors.buttonColor,
                      title: "RESET",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VarificationScreen()));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
