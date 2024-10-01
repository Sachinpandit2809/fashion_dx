import 'package:fashion_dx/resource/styles/app_colors.dart';
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

class ReUsableRowSmallText extends StatelessWidget {
  String title;
  String subTitle;
  ReUsableRowSmallText(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: KTextStyle.k_12.copyWith(color: AppColors.grey),
        ),
        Text(
          subTitle,
          style: KTextStyle.k_14.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}

class ReUsableRowMediumText extends StatelessWidget {
  String title;
  String subTitle;
  ReUsableRowMediumText(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: KTextStyle.k_14.copyWith(color: AppColors.grey),
        ),
        Text(
          subTitle,
          style: KTextStyle.k_16.copyWith(color: AppColors.black),
        )
      ],
    );
  }
}
