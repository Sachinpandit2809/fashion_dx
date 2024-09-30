import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ReUsableRow extends StatelessWidget {
  String title;
  String subTitle;
  ReUsableRow({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: KTextStyle.k_18,
        ),
        Text(
          subTitle,
          style: KTextStyle.k_18,
        )
      ],
    );
  }
}
