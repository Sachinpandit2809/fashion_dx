import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/auth/create_new_password.dart';
import 'package:fashion_dx/screens/auth/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VarificationScreen extends StatefulWidget {
  const VarificationScreen({super.key});

  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {
  TextEditingController varifcationPassController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

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
                onTap: () {},
                child: const Card(
                  color: AppColors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.keyboard_arrow_left_sharp,
                      size: 32,
                    ),
                  ),
                ),
              ),
              (MediaQuery.of(context).size.height * .07).heightBox,
              const Text(
                "Varification Code",
                style: KTextStyle.k_25,
              ),
              (MediaQuery.of(context).size.height * .03).heightBox,
              Text(
                "Please enter the code we have sent in your email address",
                style: KTextStyle.k_16.copyWith(fontWeight: FontWeight.w400),
              ),
              (MediaQuery.of(context).size.height * .1).heightBox,
              Center(
                child: Pinput(
                  keyboardType: TextInputType.number,
                  controller: varifcationPassController,
                  defaultPinTheme: defaultPinTheme.copyDecorationWith(
                    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedPinTheme: defaultPinTheme.copyDecorationWith(
                    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: Color.fromRGBO(234, 239, 243, 1),
                    ),
                  ),
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
              (MediaQuery.of(context).size.height * .1).heightBox,
              Center(
                  child: FlexibleButton(
                      btnColor: AppColors.buttonColor,
                      title: "VARIFY",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewPassword()));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
