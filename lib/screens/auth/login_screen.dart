import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              const Text("Log into", style: KTextStyle.k_25),
              const Text("your account", style: KTextStyle.k_25),
              50.heightBox,
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
              20.heightBox,
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Text("Forget password?"),
                ),
              ),
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
              Center(child: Text("or login up with")),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                        height: 44,
                        width: 44,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/png/google.png")))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.phone,
                      size: 32,
                    ),
                  )
                ],
              ),
              (MediaQuery.of(context).size.height * .12).heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: Text(
                      " Sign In ",
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
