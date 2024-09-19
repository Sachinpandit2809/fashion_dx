import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class FlexibleButton extends StatefulWidget {
  String title;
  VoidCallback onPress;
  bool loading;
  double height, width;
  Color textColor;
  Color btnColor;

  FlexibleButton(
      {super.key,
      this.height = 50,
      this.width = 180,
      this.textColor = AppColors.white,
      this.btnColor = const Color.fromARGB(211, 151, 150, 152),
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  State<FlexibleButton> createState() => _FlexibleButtonState();
}

class _FlexibleButtonState extends State<FlexibleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 2),
          borderRadius: BorderRadius.circular(30),
          color: widget.btnColor,
        ),
        child: Center(
            child: widget.loading
                ? const CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 2.5,
                    strokeCap: StrokeCap.square,
                  )
                : Text(
                    widget.title,
                    style: KTextStyle.k_14.copyWith(color: AppColors.white),
                  )),
      ),
    );
  }
}
