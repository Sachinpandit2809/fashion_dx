import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class SplashOne extends StatefulWidget {
  const SplashOne({super.key});

  @override
  State<SplashOne> createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      (MediaQuery.of(context).size.height * .1).heightBox,
                      const Text(
                        "Discover Something New",
                        style: KTextStyle.k_20,
                      ),
                      12.heightBox,
                      const Text(
                        "Special new Arival for you",
                        style: KTextStyle.k_14,
                      ),
                    ],
                  )),
              Expanded(flex: 5, child: Container(color: AppColors.grey)),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .22,
            left: MediaQuery.of(context).size.width * .18,
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * .6,
                  // width: MediaQuery.of(context).size.height * .8,
                  height: 368,
                  width: 254,
                  decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("assets/images/png/splash1.png"),
                          fit: BoxFit.contain)),
                ),
                100.heightBox,
                FlexibleButton(title: "title", onPress: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//streak
