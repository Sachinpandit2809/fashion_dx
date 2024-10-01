import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/re_usable_row.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screens/details_screen/product_cart_screen.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ProductOrderScreen extends StatefulWidget {
  const ProductOrderScreen({super.key});

  @override
  State<ProductOrderScreen> createState() => _ProductOrderScreenState();
}

class _ProductOrderScreenState extends State<ProductOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController orderTabConroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderTabConroller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              (MediaQuery.sizeOf(context).height * .05).heightBox,
              // (  )
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 32),
                  Text(
                    "My Orders",
                    style: KTextStyle.k_20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductCartScreen()));
                    },
                    child: Icon(
                      Icons.notification_add_sharp,
                      size: 32,
                    ),
                  )
                ],
              ),
              30.heightBox,
              TabBar(
                controller: orderTabConroller,
                indicatorPadding: EdgeInsets.symmetric(horizontal: -30),
                indicator: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(22),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Pending'),
                  Tab(text: 'Delivered'),
                  Tab(text: 'Cancelled'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: orderTabConroller,
                  children: [
                    //  tab 1
                    ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ReUsableRow(
                                      title: "Order #123",
                                      subTitle: DateFormat("dd/MM/yyyy")
                                          .format(DateTime.now()),
                                    ),
                                    ReUsableRow(
                                        title: "Tracking number",
                                        subTitle: "sachin2809"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReUsableRow(
                                            title: "Quantity",
                                            subTitle: "\t 2"),
                                        ReUsableRow(
                                            title: "SubTotal",
                                            subTitle: "\t \u{20B9} 2"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "PENDING",
                                          style: KTextStyle.k_16
                                              .copyWith(color: Colors.orange),
                                        ),
                                        FlexibleButton(
                                            btnColor: Colors.orange,
                                            width: 120,
                                            height: 40,
                                            title: "Details",
                                            onPress: () {})
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        }),
                    // tab 2

                    ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ReUsableRow(
                                      title: "Order #123",
                                      subTitle: DateFormat("dd/MM/yyyy")
                                          .format(DateTime.now()),
                                    ),
                                    ReUsableRow(
                                        title: "Tracking number",
                                        subTitle: "sachin2809"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReUsableRow(
                                            title: "Quantity",
                                            subTitle: "\t 2"),
                                        ReUsableRow(
                                            title: "SubTotal",
                                            subTitle: "\t \u{20B9} 2"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "DELIVERED",
                                          style: KTextStyle.k_16
                                              .copyWith(color: Colors.green),
                                        ),
                                        FlexibleButton(
                                            btnColor: Colors.green,
                                            width: 120,
                                            height: 40,
                                            title: "Details",
                                            onPress: () {})
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        }),

                    // Tab 3

                    ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ReUsableRow(
                                      title: "Order #123",
                                      subTitle: DateFormat("dd/MM/yyyy")
                                          .format(DateTime.now()),
                                    ),
                                    ReUsableRow(
                                        title: "Tracking number",
                                        subTitle: "sachin2809"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReUsableRow(
                                            title: "Quantity",
                                            subTitle: "\t 2"),
                                        ReUsableRow(
                                            title: "SubTotal",
                                            subTitle: "\t \u{20B9} 2"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "CANCELLED",
                                          style: KTextStyle.k_16
                                              .copyWith(color: Colors.red),
                                        ),
                                        FlexibleButton(
                                            btnColor: Colors.red,
                                            width: 120,
                                            height: 40,
                                            title: "Details",
                                            onPress: () {})
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
