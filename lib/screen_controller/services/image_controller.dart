import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageController with ChangeNotifier {
  File? _image;
  File? get image => _image;
  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  final picker = ImagePicker();
  String? _imageUrl;

  // Function to capture image from camera
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setImage(File(pickedFile.path));

      print("Image selected: $_image");
    } else {
      Utils.toastErrorMessage("Image not selected");
    }
    notifyListeners();
  }

  // Function to upload the image to Firebase Storage
  Future uploadImageToFirebase() async {
    if (_image == null) return;
    try {
      String fileName = DateTime.now().toString();
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      // Get the URL of the uploaded image
      _imageUrl = await taskSnapshot.ref.getDownloadURL();
      debugPrint("Image uploaded and URL/////////////////////=>: $_imageUrl");
    } catch (e) {
      Utils.toastErrorMessage("Error uploading image" + e.toString());
      debugPrint("Error uploading image: $e");
    }
  }
}
