import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/modals/fashion_home.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:fashion_dx/screen_controller/screenController/product_controller.dart';
import 'package:fashion_dx/screen_controller/services/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProductScreen extends StatefulWidget {
  FashionData? fashionData;
  EditProductScreen({super.key, required this.fashionData});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // File? image;
  String image = '';
  @override
  void initState() {
    super.initState();
    titleController.text = widget.fashionData!.title.toString();
    descriptionController.text = widget.fashionData!.description.toString();
    priceController.text = widget.fashionData!.price.toString();
    // image = widget.fashionData!.image.toString();
  }

  @override
  void dispose() {

    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "UPDATE PRODUCT",
          style: KTextStyle.k_20,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Consumer2<ImageController, ProductController>(
              builder: (context, imageController, addProductController, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Text(
                    "If you want to update the image \n1. change image \n2. upload \n3 update product"),
                (MediaQuery.sizeOf(context).height * .01).heightBox,
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  // color: Colors.cyanAccent,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.fashionData!.image.toString()),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // _image == null ? Text('No image selected.') : Image.file(_image!),
                            imageController.image == null
                                ? FlexibleButton(
                                    width: 120,
                                    title: "CHANGE",
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
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: FileImage(
                                              imageController.image!.absolute,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                            10.heightBox,
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
                      ],
                    ),
                  ),
                ),
                (MediaQuery.sizeOf(context).height * .05).heightBox,
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlexibleButton(
                          title: "UPDATE PRODUCT",
                          loading: addProductController.addProductLoading,
                          width: 200,
                          btnColor: AppColors.buttonColor,
                          onPress: () {
                            String imageLink = imageController.imageUrl == null
                                ? widget.fashionData!.image.toString()
                                : imageController.imageUrl.toString();

                            // FashionData data = FashionData(
                            //     title: titleController.text.toString(),
                            //     image: imageLink,
                            //     description:
                            //         descriptionController.text.toString(),
                            //     price: priceController.text.toString(),
                            //     // iV: widget.fashionData!.iV,
                            //     sId: widget.fashionData!.sId);
                            // FashionHomeModel d =
                            //     FashionHomeModel(fashionData: [data]);
                            // dynamic s = d.toJson();
                            // addProductController.updateProduct(
                            //     s['fashionData'][0], id, context);
                            // debugPrint(s['fashionData'][0].toString());

                            String id = widget.fashionData!.sId.toString();
                            debugPrint(id);

                            Map checkData = {
                              'title': titleController.text.toString(),
                              'image': imageLink,
                              'description':
                                  descriptionController.text.toString(),
                              'price': priceController.text.toString(),
                              'id': widget.fashionData!.sId.toString(),
                            };
                            addProductController.updateProduct(
                              checkData,
                              id,
                              context,
                            );
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
