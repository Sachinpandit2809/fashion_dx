import 'package:fashion_dx/const/resource.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<bool> isSelected = [false, false, false];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(R.ASSETS_IMAGES_PNG_SPLASH3_PNG),
                      ),
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          right: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.arrow_back_ios),
                              true
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 28,
                                    )
                                  : Icon(Icons.favorite_outline),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.cyan.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "jackets",
                                  style: KTextStyle.k_20,
                                ),
                                Text(
                                  "2345",
                                  style: KTextStyle.k_20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "SIZE",
                                  style: KTextStyle.k_18,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Align(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSelected[0] = true;
                                              isSelected[1] = false;
                                              isSelected[2] = false;
                                              currentIndex = 0;
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: isSelected[0]
                                                ? Colors.red
                                                : Colors.amber,
                                            child: const Text("S"),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSelected[0] = false;
                                              isSelected[1] = true;
                                              isSelected[2] = false;
                                              currentIndex = 1;
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: isSelected[1]
                                                ? Colors.red
                                                : Colors.amber,
                                            child: const Text("M"),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSelected[0] = false;
                                              isSelected[1] = false;
                                              isSelected[2] = true;
                                              currentIndex = 2;
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: isSelected[2]
                                                ? Colors.red
                                                : Colors.amber,
                                            child: const Text("L"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            7.heightBox,
                            const ExpansionTile(
                              // collapsedBackgroundColor: Colors.green,

                              title: Text("DESCRIPTION"),
                              backgroundColor: Colors.white,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                    "This example demonstrates a group of three radio buttons, and the text below displays the currently selected option. Let me know if you'd like to add more features!"),
                              ],
                            ),
                            7.heightBox,
                            ExpansionTile(
                              title: const Text("REVIEWS"),
                              backgroundColor: Colors.white,
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                      itemCount: 20,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              // color: Colors.red,
                                              margin: const EdgeInsets.all(10),
                                              padding: const EdgeInsets.all(8),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 18,
                                                    child: Text("J"),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text("Jenifer"),
                                                        SizedBox(
                                                          height: 20,
                                                          child:
                                                              ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: 5,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .green,
                                                                size: 16,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text(
                                              "More commonly, these fake comments will look like spam. They'll be generic comments like “Love this”, “Beautiful!”, “Love this look”, etc.",
                                            ),
                                            Divider()
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                            7.heightBox,
                            ExpansionTile(
                                title: Text("SIMILAR PRODUCTS"),
                                children: [
                                  SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 13,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 160,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        R.ASSETS_IMAGES_PNG_SPLASH2_PNG,
                                                      ),
                                                      fit: BoxFit.cover)),
                                            ),
                                            5.heightBox,
                                            Text("white Long Dress ",
                                                style: KTextStyle.k_14),
                                            Text('\u{20B9}234',
                                                style: KTextStyle.k_18),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ]),
                            100.heightBox,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopify_rounded,
                            size: 28,
                            color: AppColors.white,
                          ),
                          Text("Add To Cart",
                              style: KTextStyle.k_18.copyWith(
                                color: AppColors.white,
                              ))
                        ],
                      ),
                      Divider(
                        color: AppColors.white,
                        endIndent: 80,
                        indent: 80,
                        thickness: 4,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
