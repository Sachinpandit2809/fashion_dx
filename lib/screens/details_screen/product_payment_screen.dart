import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ProductPaymentScreen extends StatefulWidget {
  const ProductPaymentScreen({super.key});

  @override
  State<ProductPaymentScreen> createState() => _ProductPaymentScreenState();
}

class _ProductPaymentScreenState extends State<ProductPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
             65.heightBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "Payment",
                    style: KTextStyle.k_20,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            

        ],
      ),
    );
  }
}