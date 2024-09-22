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
    return CarouselView(itemExtent: 10, children: [
    Image.asset(R.ASSETS_IMAGES_PNG_GOOGLE_PNG),
    Image.asset(R.ASSETS_IMAGES_PNG_SPLASH1_PNG),
    Image.asset(R.ASSETS_IMAGES_PNG_SPLASH2_PNG),
    Image.asset(R.ASSETS_IMAGES_PNG_SUCCESS_PNG)


    ]);
  }
}