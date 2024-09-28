import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/data/response/status.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/screenController/fashion_home_controller.dart';
import 'package:fashion_dx/screen_controller/screenController/product_controller.dart';
import 'package:fashion_dx/screen_controller/services/image_controller.dart';
import 'package:fashion_dx/screens/home/add_fashion_screen.dart';
// import 'package:fashion_dx/screens/home/add_product_screen.dart';
import 'package:fashion_dx/screens/home/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FashionHomeScreen extends StatefulWidget {
  const FashionHomeScreen({super.key});

  @override
  State<FashionHomeScreen> createState() => _FashionHomeScreenState();
}

class _FashionHomeScreenState extends State<FashionHomeScreen> {
  FashionHomeController fashionHomeController = FashionHomeController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fashionHomeController.fetchFashionHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ChangeNotifierProvider<FashionHomeController>(
        create: (constext) => fashionHomeController,
        child: Consumer3<FashionHomeController, ImageController,
            ProductController>(
          builder: (context, value, imageController, productController, child) {
            switch (value.fashionDataList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                    child: Text(value.fashionDataList.message.toString()));
              case Status.COMPLETED:
                return Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 40, 18, 18),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.menu, size: 32),
                          Text(
                            "GemStore",
                            style: KTextStyle.k_20,
                          ),
                          Icon(
                            Icons.notification_add_sharp,
                            size: 32,
                          )
                        ],
                      ),
                      // (MediaQuery.of(context).size.height * .05).heightBox,
                      Expanded(
                        child: ListView.builder(
                            itemCount:
                                value.fashionDataList.data!.fashionData!.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    imageController.setImageToNull();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (constext) =>
                                                EditProductScreen(
                                                    fashionData: value
                                                        .fashionDataList
                                                        .data!
                                                        .fashionData![index])));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 380,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.grey),
                                            image: DecorationImage(
                                              image: NetworkImage(value
                                                  .fashionDataList
                                                  .data!
                                                  .fashionData![index]
                                                  .image
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(22)),
                                      ),
                                      5.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  value.fashionDataList.data!
                                                      .fashionData![index].title
                                                      .toString(),
                                                  style: KTextStyle.k_16),
                                              5.heightBox,
                                              Text(
                                                  "\u{20B9}${value.fashionDataList.data!.fashionData![index].price}",
                                                  style: KTextStyle.k_18),
                                            ],
                                          ),
                                          // Spacer(),
                                          FlexibleButton(
                                              btnColor: Colors.red,
                                              width: 120,
                                              title: "DELETE",
                                              loading: productController
                                                  .deleteProductLoading,
                                              onPress: () {
                                                productController.deleteProduct(
                                                    {
                                                      "id": value
                                                          .fashionDataList
                                                          .data!
                                                          .fashionData![index]
                                                          .sId
                                                          .toString()
                                                    },
                                                    context);
                                              }),
                                          // SizedBox(
                                          //   width: 20,
                                          // )
                                        ],
                                      ),
                                      // Divider(),
                                      20.heightBox,
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );

              default:
                return SizedBox();
            }
          },
        ),
      ),
      floatingActionButton:
          Consumer<ImageController>(builder: (context, value, _) {
        return FloatingActionButton(
          onPressed: () {
            value.setImageToNull();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddFashionScreen()));
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
