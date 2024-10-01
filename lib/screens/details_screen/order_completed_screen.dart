import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class OrderCompletedScreen extends StatefulWidget {
  const OrderCompletedScreen({super.key});

  @override
  State<OrderCompletedScreen> createState() => _OrderCompletedScreenState();
}

class _OrderCompletedScreenState extends State<OrderCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Order Completed",
              style: KTextStyle.k_25,
            ),
            Icon(
              Icons.shopify_sharp,
              size: 200,
            ),
            Text(
              "Thank You For Shopping",
              style: KTextStyle.k_14,
            ),
            Text(
              "You can view your Order in order",
              style: KTextStyle.k_14,
            ),
            Text(
              "Section",
              style: KTextStyle.k_14,
            ),
            50.heightBox,
            FlexibleButton(
                btnColor: AppColors.buttonColor,
                width: 300,
                title: "Continue Shopping",
                onPress: () {})
          ],
        ),
      ),
    );
  }
}
