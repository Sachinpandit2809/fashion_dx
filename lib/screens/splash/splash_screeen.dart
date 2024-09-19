import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/png/splash.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.5),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              children: [
                Text(
                  "Welcome to Fluxstore",
                  style: KTextStyle.k_25.copyWith(color: AppColors.white),
                ),
                30.heightBox,
                Text(
                  "The home for Fashion",
                  style: KTextStyle.k_14.copyWith(color: AppColors.white),
                ),
                60.heightBox,
                FlexibleButton(title: "Get Started", onPress: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
