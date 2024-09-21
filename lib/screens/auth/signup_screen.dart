import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/auth_controller.dart';
import 'package:fashion_dx/screens/auth/login_screen.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confermPasswordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confermPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Consumer<AuthController>(builder: (context, authController, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.heightBox,
                const Text("Create", style: KTextStyle.k_25),
                const Text("your account", style: KTextStyle.k_25),
                5.heightBox,
                KTextFormField(
                    hintText: "Enter Your name",
                    labelText: "name",
                    controller: usernameController,
                    validator: (val) {
                      return null;
                    }),
                KTextFormField(
                    hintText: "Enter Your email",
                    labelText: "email",
                    controller: emailController,
                    validator: (val) {
                      return null;
                    }),
                KTextFormField(
                    hintText: "Enter Your password",
                    labelText: "password",
                    controller: passwordController,
                    validator: (val) {
                      return null;
                    }),
                KTextFormField(
                    hintText: "Enter Your Conferm-password",
                    labelText: "Conferm-password",
                    controller: confermPasswordController,
                    validator: (val) {
                      return null;
                    }),
                30.heightBox,
                Center(
                  child: FlexibleButton(
                    title: "SIGN UP",
                    loading: authController.signUpLoading,
                    width: 150,
                    onPress: () {
                      if (passwordController.text ==
                          confermPasswordController.text) {
                        Map data = {
                          'username': usernameController.text.toString(),
                          'email': emailController.text.toString(),
                          'password': passwordController.text.toString()
                        };
                        authController.signup(data);
                      } else {
                        Utils.toastErrorMessage("password not match");
                      }
                    },
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/png/google.png")))),
                    ),
                    const SizedBox(
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
            );
          }),
        ),
      ),
    );
  }
}
