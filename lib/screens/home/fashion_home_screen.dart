import 'package:fashion_dx/data/response/status.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/screenController/fashion_home_controller.dart';
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
        child: Consumer<FashionHomeController>(
          builder: (context, value, child) {
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
                      Row(
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 380,
                                      width: 300,
                                      decoration: BoxDecoration(
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
                                    Text(
                                        value.fashionDataList.data!
                                            .fashionData![index].title
                                            .toString(),
                                        style: KTextStyle.k_16),
                                    5.heightBox,
                                    Text(
                                        "\u{20B9}${value.fashionDataList.data!.fashionData![index].price}",
                                        style: KTextStyle.k_18),
                                    20.heightBox
                                  ],
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
    );
  }
}
