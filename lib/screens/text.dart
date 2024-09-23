import 'package:fashion_dx/const/resource.dart';
import 'package:flutter/material.dart';

class TextCarouselView extends StatefulWidget {
  const TextCarouselView({super.key});

  @override
  State<TextCarouselView> createState() => _TextCarouselViewState();
}

class _TextCarouselViewState extends State<TextCarouselView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("carousel "),
      ),
      // body: CarouselView(itemExtent: 1, children: [
      //   Image.asset(R.ASSETS_IMAGES_PNG_GOOGLE_PNG),
      //   Image.asset(R.ASSETS_IMAGES_PNG_SPLASH1_PNG),
      //   Image.asset(R.ASSETS_IMAGES_PNG_SPLASH2_PNG),
      //   Image.asset(R.ASSETS_IMAGES_PNG_SUCCESS_PNG)
      // ]),

      body: Column(
        children: [
          Container(
            height: 300,
            child: Expanded(

                // child: CarouselView(

                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(150),
                //   ),
                //   scrollDirection: Axis.horizontal,
                //   itemExtent: 4,
                //   children: [
                //     Container(
                //       height: 100,
                //       width: 100,
                //       decoration: BoxDecoration(color: Colors.amber),
                //     ),
                //     Text('Item 1'),
                //     Text('Item 2'),
                //     Text('Item 3'),
                //   ],
                // ),
                child: CarouselView(
              itemExtent: 2,
              children: [
                Container(
                  child: Image.asset(R.ASSETS_IMAGES_PNG_SPLASH_PNG),
                ),
                Container(
                  child: Image.asset(R.ASSETS_IMAGES_PNG_SPLASH_PNG),
                ),
                Container(
                  child: Image.asset(R.ASSETS_IMAGES_PNG_SPLASH_PNG),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
