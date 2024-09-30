import 'package:fashion_dx/common_widgets/flexible_button.dart';
import 'package:fashion_dx/common_widgets/k_text_form_field.dart';
import 'package:fashion_dx/resource/ext/num_ext.dart';
import 'package:fashion_dx/resource/styles/app_colors.dart';
import 'package:fashion_dx/resource/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class ProductCheckoutScreen extends StatefulWidget {
  const ProductCheckoutScreen({super.key});

  @override
  State<ProductCheckoutScreen> createState() => _ProductCheckoutScreenState();
}

class _ProductCheckoutScreenState extends State<ProductCheckoutScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final aditionalPhoneController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    aditionalPhoneController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    stateController.dispose();
    countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "Checkout",
                    style: KTextStyle.k_20,
                  ),
                  SizedBox()
                ],
              ),
              20.heightBox,
              Text(
                "Shipping Details",
                style: KTextStyle.k_18,
              ),
              Text("Step 1"),
              KTextFormField(
                  hintText: "Name",
                  labelText: "name",
                  controller: nameController,
                  validator: (v) {
                    return null;
                  }),
              KTextFormField(
                  hintText: "Phone",
                  labelText: "phone",
                  controller: phoneController,
                  validator: (v) {
                    return null;
                  }),
              KTextFormField(
                  hintText: "Aditional no.",
                  labelText: "Aditional no.",
                  controller: addressController,
                  validator: (v) {
                    return null;
                  }),
              KTextFormField(
                  hintText: "Address",
                  labelText: "address",
                  controller: addressController,
                  validator: (v) {
                    return null;
                  }),
              KTextFormField(
                  hintText: "Pincode",
                  labelText: "pincode",
                  controller: pincodeController,
                  validator: (v) {
                    return null;
                  }),
              KTextFormField(
                  hintText: "State",
                  labelText: "State",
                  controller: stateController,
                  validator: (v) {
                    return null;
                  }),
              KTextFormField(
                  hintText: "Country",
                  labelText: "Country",
                  controller: countryController,
                  validator: (v) {
                    return null;
                  }),
              20.heightBox,
              Center(
                child: FlexibleButton(
                    width: 300,
                    btnColor: AppColors.buttonColor,
                    title: "Continue to payment",
                    onPress: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
