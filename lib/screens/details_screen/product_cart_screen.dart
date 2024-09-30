import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/re_usable_row.dart';
import 'package:fashion_dx/const/resource.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({super.key});

  @override
  State<ProductCartScreen> createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            65.heightBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "Your Cart",
                    style: KTextStyle.k_20,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            // cart widget

            Expanded(
              child: ListView.builder(
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 116,
                      // width: 312,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        // color: Colors.cyan,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      R.ASSETS_IMAGES_PNG_SPLASH3_PNG)),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                              ),
                              // color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("SportWear Set"),
                                    Checkbox(
                                        activeColor: AppColors.checkBoxGreen,
                                        value: true,
                                        onChanged: (v) {})
                                  ],
                                ),
                                const Text("\u{20B9} 8897"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Size - L",
                                      style: KTextStyle.k_13,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: AppColors.grey)),
                                      width: 100,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                              radius: 13,
                                              child: Icon(Icons.remove)),
                                          Text(
                                            "1",
                                            style: KTextStyle.k_18,
                                          ),
                                          CircleAvatar(
                                              radius: 13,
                                              child: Icon(Icons.add))
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 180,
              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  20.heightBox,
                  ReUsableRow(
                      title: "Product Price", subTitle: "\u{20B9} 8897"),
                  20.heightBox,
                  ReUsableRow(title: "Sub Total", subTitle: "\u{20B9} 8897"),
                  20.heightBox,
                  FlexibleButton(
                      width: 300,
                      btnColor: AppColors.buttonColor,
                      title: "Proceed To Checkout",
                      onPress: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
