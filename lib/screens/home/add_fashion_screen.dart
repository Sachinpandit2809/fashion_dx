import 'dart:io';

import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/screenController/product_controller.dart';
import 'package:fashion_dx/screen_controller/services/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddFashionScreen extends StatefulWidget {
  const AddFashionScreen({super.key});

  @override
  State<AddFashionScreen> createState() => _AddFashionScreenState();
}

class _AddFashionScreenState extends State<AddFashionScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer2<ImageController, ProductController>(
              builder: (context, imageController, addProductController, _) {
            return Column(
              children: [
                KTextFormField(
                    hintText: "enter title",
                    labelText: "title",
                    controller: titleController,
                    validator: (validator) {
                      return null;
                    }),
                KTextFormField(
                    hintText: "enter description",
                    labelText: "description",
                    controller: descriptionController,
                    validator: (validator) {
                      return null;
                    }),
                KTextFormField(
                    hintText: "enter price",
                    labelText: "price",
                    controller: priceController,
                    validator: (validator) {
                      return null;
                    }),
                (MediaQuery.sizeOf(context).height * .01).heightBox,
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // _image == null ? Text('No image selected.') : Image.file(_image!),
                      imageController.image == null
                          ? FlexibleButton(
                              width: 120,
                              title: "GET IMAGE",
                              onPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);

                                                imageController.getImage(
                                                    ImageSource.camera);
                                              },
                                              child: const Icon(
                                                Icons.camera_alt,
                                                size: 45,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                imageController.getImage(
                                                    ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.photo,
                                                size: 45,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              })
                          : Container(
                              height: 200, width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: FileImage(
                                        imageController.image!.absolute,
                                      ),
                                      fit: BoxFit.cover)),
                              // child: Image.file(
                              //   imageController.image!.absolute,
                              //   height: 200,
                              // ),
                            ),

                      FlexibleButton(
                          title: "UPLOAD",
                          width: 120,
                          loading: imageController.uploadLoading,
                          // btnColor: AppColors.buttonColor,
                          onPress: () {
                            imageController.uploadImageToFirebase();
                          }),
                    ],
                  ),
                ),
                (MediaQuery.sizeOf(context).height * .05).heightBox,
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlexibleButton(
                          title: "ADD PRODUCT",
                          loading: addProductController.addProductLoading,
                          // width: 120,
                          btnColor: AppColors.buttonColor,
                          onPress: () {
                            Map data = {
                              'title': titleController.text.toString(),
                              'image': imageController.imageUrl,
                              'description':
                                  descriptionController.text.toString(),
                              'price': priceController.text.toString()
                            };
                            addProductController.addProduct(data, context);
                          }),
                      (MediaQuery.sizeOf(context).height * .01).heightBox,
                      FlexibleButton(
                          width: 120,
                          title: "CANCEL",
                          btnColor: Colors.red,
                          onPress: () {
                            imageController.setImageToNull();
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
