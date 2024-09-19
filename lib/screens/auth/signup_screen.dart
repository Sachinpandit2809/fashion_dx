import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confermPasswordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confermPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.heightBox,
              const Text("Create", style: KTextStyle.k_25),
              const Text("your account", style: KTextStyle.k_25),
              5.heightBox,
              KTextFormField(
                  hintText: "Enter Your name",
                  labelText: "name",
                  controller: nameController,
                  validator: (val) {}),
              KTextFormField(
                  hintText: "Enter Your email",
                  labelText: "email",
                  controller: nameController,
                  validator: (val) {}),
              KTextFormField(
                  hintText: "Enter Your password",
                  labelText: "password",
                  controller: nameController,
                  validator: (val) {}),
              KTextFormField(
                  hintText: "Enter Your Conferm-password",
                  labelText: "Conferm-password",
                  controller: nameController,
                  validator: (val) {}),
              30.heightBox,
              Center(
                child: FlexibleButton(
                  title: "SIGN UP",
                  // loading: true,
                  width: 150,
                  onPress: () {},
                  btnColor: AppColors.buttonColor,
                ),
              ),
              20.heightBox,
              Center(child: Text("or sign up with")),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/png/google.png")))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.phone,
                      size: 32,
                    ),
                  )
                ],
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      " Log In ",
                      style: KTextStyle.k_13.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
