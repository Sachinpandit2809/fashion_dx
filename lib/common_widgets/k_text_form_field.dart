import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';


class KTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextInputType keyBoard;
  final String labelText;

  const KTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.keyBoard = TextInputType.text,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyBoard,
        style: KTextStyle.k_16,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: KTextStyle.k_13.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
