import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/authController/auth_controller.dart';
import 'package:fashion_dx/screens/auth/forget_password_screen.dart';
import 'package:fashion_dx/screens/auth/phone_number_screen.dart';
import 'package:fashion_dx/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController confermPasswordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    // usernameController.dispose();
    // nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
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
                const Text("Log into", style: KTextStyle.k_25),
                const Text("your account", style: KTextStyle.k_25),
                50.heightBox,
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
                20.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen()));
                    },
                    child: const Text("Forget password?"),
                  ),
                ),
                30.heightBox,
                Center(
                  child: FlexibleButton(
                    title: "LOG IN",
                    loading: authController.loginLoading,
                    width: 150,
                    onPress: () {
                      debugPrint("triggred");
                      Map data = {
                        'email': emailController.text.toString(),
                        'password': passwordController.text.toString()
                      };
                      authController.login(data, context);
                      debugPrint("triggred completed");
                    },
                    btnColor: AppColors.buttonColor,
                  ),
                ),
                20.heightBox,
                const Center(child: Text("or login up with")),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneNumberScreen()));
                      },
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
            );
          }),
        ),
      ),
    );
  }
}
