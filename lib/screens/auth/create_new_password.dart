import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_password_textformfield.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController newPasswordConroller = TextEditingController();
  TextEditingController confermPassController = TextEditingController();
  bool visiblity = false;
  bool confVisiblity = false;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
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
                "Create New Password",
                style: KTextStyle.k_25,
              ),
              (MediaQuery.of(context).size.height * .03).heightBox,
              Text(
                "Your password must be different from previouslyused password",
                style: KTextStyle.k_16.copyWith(fontWeight: FontWeight.w400),
              ),
              (MediaQuery.of(context).size.height * .1).heightBox,
              KPasswordTextformfield(
                  hintText: "new password",
                  labelText: "new password",
                  visibility: visiblity,
                  visibiltyFunction: () {
                    visiblity = !visiblity;
                    setState(() {});
                  },
                  controller: newPasswordConroller,
                  validator: (a) {
                    if (newPasswordConroller.text.isEmpty) {
                      return "enter new password";
                    }
                    return null;
                  }),
              KPasswordTextformfield(
                  visibility: confVisiblity,
                  visibiltyFunction: () {
                    confVisiblity = !confVisiblity;
                    setState(() {});
                  },
                  hintText: "conferm Password",
                  labelText: "conferm Password",
                  controller: confermPassController,
                  validator: (a) {
                    if (confermPassController.text.isEmpty) {
                      return " conferm Password";
                    }
                    return null;
                  }),
              (MediaQuery.of(context).size.height * .06).heightBox,
              Center(
                  child: FlexibleButton(
                      btnColor: AppColors.buttonColor,
                      title: "Conferm",
                      loading: false,
                      onPress: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ForgetPasswordScreen()));

                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * .4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(28),
                                      topRight: Radius.circular(28))),
                              child: Column(
                                children: [
                                  (MediaQuery.of(context).size.height * 0.04)
                                      .heightBox,
                                  CircleAvatar(
                                      backgroundColor:
                                          AppColors.grey.withOpacity(0.05),
                                      radius: 50,
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/png/Success.png"),
                                      )),
                                  Text(
                                    "Your password has been changed ",
                                    style: KTextStyle.k_18,
                                  ),
                                  Text(
                                    "Welcome Back! Discover Now! ",
                                    style: KTextStyle.k_12,
                                  ),
                                  (MediaQuery.of(context).size.height * 0.03)
                                      .heightBox,
                                  FlexibleButton(
                                      width: 280,
                                      btnColor: AppColors.black,
                                      title: "Browse Now",
                                      onPress: () {})
                                ],
                              ),
                            );
                          },
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
