import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/re_usable_row.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/details_screen/order_completed_screen.dart';
import 'package:flutter/material.dart';

class ProductPaymentScreen extends StatefulWidget {
  const ProductPaymentScreen({super.key});

  @override
  State<ProductPaymentScreen> createState() => _ProductPaymentScreenState();
}

class _ProductPaymentScreenState extends State<ProductPaymentScreen> {
  int _selectedValue = 1; // Default selected value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            65.heightBox,
            Row(
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
            20.heightBox,
            // body works
            Column(
              children: [
                RadioListTile<int>(
                  title: Text('CARD'),
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('CASH ON DELIVERY'),
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ],
            ),
            20.heightBox,

            ReUsableRow(title: "Product Price", subTitle: "\u{20B9} 8897"),
            20.heightBox,
            ReUsableRow(title: "Sub Total", subTitle: "\u{20B9} 8897"),
            20.heightBox,

            Row(
              children: [
                Checkbox(value: true, onChanged: (e) {}),
                Text(
                  "I am agree To Term And Condition",
                  style: KTextStyle.k_14,
                )
              ],
            ),
            30.heightBox,
            FlexibleButton(
                btnColor: AppColors.buttonColor,
                width: 300,
                title: "Place My Order",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderCompletedScreen()));
                })
            // next
          ],
        ),
      ),
    );
  }
}
