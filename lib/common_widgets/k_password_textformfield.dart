import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KPasswordTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextInputType keyBoard;
  final String labelText;
  bool visibility;
  VoidCallback visibiltyFunction;

  KPasswordTextformfield(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.visibility = true,
      required this.visibiltyFunction,
      this.keyBoard = TextInputType.text,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: visibility,
        keyboardType: keyBoard,
        style: KTextStyle.k_16,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffix: GestureDetector(
              onTap: visibiltyFunction,
              child:
                  Icon(visibility ? Icons.visibility : Icons.visibility_off)),
          hintStyle: KTextStyle.k_13.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
