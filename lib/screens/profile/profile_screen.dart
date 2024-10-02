import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/const/resource.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    genderController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            65.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  const Text(
                    "Your Cart",
                    style: KTextStyle.k_20,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            // profile widget
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(R.ASSETS_IMAGES_PNG_SPLASH1_PNG),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Icon(Icons.camera_alt),
                  ),
                )
              ],
            ),

            Form(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  50.heightBox,
                  KTextFormField(
                      hintText: "Full Name",
                      labelText: "name",
                      controller: fullNameController,
                      validator: (e) {}),
                  // 5.heightBox,
                  KTextFormField(
                      hintText: "Email",
                      labelText: "email",
                      controller: emailController,
                      validator: (e) {}),
                  // 5.heightBox,
                  KTextFormField(
                      hintText: "Gender",
                      labelText: "gender",
                      controller: genderController,
                      validator: (e) {}),
                  // 5.heightBox,
                  KTextFormField(
                      hintText: "Phone number",
                      labelText: "number",
                      controller: phoneController,
                      validator: (e) {}),
                  10.heightBox,
                  FlexibleButton(
                      btnColor: AppColors.buttonColor,
                      title: "Save Changes",
                      onPress: () {})
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
