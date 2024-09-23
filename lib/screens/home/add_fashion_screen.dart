import 'dart:io';

import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/services/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFashionScreen extends StatefulWidget {
  const AddFashionScreen({super.key});

  @override
  State<AddFashionScreen> createState() => _AddFashionScreenState();
}

class _AddFashionScreenState extends State<AddFashionScreen> {
  final nameController = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD",
          style: KTextStyle.k_20,
        ),
      ),
      body: Consumer<ImageController>(builder: (context, imageController, _) {
        return Column(
          children: [
            KTextFormField(
                hintText: "hintText",
                labelText: "labelText",
                controller: nameController,
                validator: (validator) {
                  return null;
                }),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _image == null ? Text('No image selected.') : Image.file(_image!),
                  GestureDetector(
                    onTap: () {
                      imageController.getImage();
                    },
                    child: imageController.image == null
                        ? Text("Get Image")
                        : Image.file(imageController.image!.absolute),
                  ),
                  GestureDetector(
                    onTap: () {
                      imageController.uploadImageToFirebase();
                    },
                    child: Text('Upload to Firebase'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
