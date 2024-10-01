import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/re_usable_row.dart';
import 'package:fashion_dx/const/resource.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class DeleveredScreen extends StatefulWidget {
  const DeleveredScreen({super.key});

  @override
  State<DeleveredScreen> createState() => _DeleveredScreenState();
}

class _DeleveredScreenState extends State<DeleveredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              45.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "Order id",
                    style: KTextStyle.k_20,
                  ),
                  SizedBox()
                ],
              ),
              20.heightBox,
              Image.asset(R.ASSETS_IMAGES_PNG_ORDER_DELIVERED_PNG),
              20.heightBox,
              Card(
                color: AppColors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReUsableRowSmallText(
                          title: "Order number", subTitle: "0013"),
                      ReUsableRowSmallText(
                          title: "Tracking Number", subTitle: "0042i4u"),
                      ReUsableRowSmallText(
                          title: "Delevery add", subTitle: "shivpuri colony "),
                    ],
                  ),
                ),
              ),
              40.heightBox,
              Card(
                color: AppColors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReUsableRowMediumText(
                          title: "Maxi Dress", subTitle: "\u{20B9} 1200"),
                      5.heightBox,
                      ReUsableRowMediumText(
                          title: "Lienel Dress", subTitle: "\u{20B9} 1200"),
                      5.heightBox,
                      ReUsableRowMediumText(
                          title: "Sub Total", subTitle: "\u{20B9} 2400 "),
                      5.heightBox,
                      Divider(),
                      10.heightBox,
                      ReUsableRow(title: "Total", subTitle: "\u{20B9} 2400")
                    ],
                  ),
                ),
              ),
              30.heightBox,
              FlexibleButton(title: "Return Home", onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
