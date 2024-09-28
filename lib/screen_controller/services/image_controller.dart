import 'dart:io';

// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageController with ChangeNotifier {
  bool _uploadLoading = false;
  bool get uploadLoading => _uploadLoading;
  void setUploadLoading(bool load) {
    _uploadLoading = load;
    notifyListeners();
  }

  File? _image;
  File? get image => _image;
  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  final picker = ImagePicker();
  String? _imageUrl;
  String? get imageUrl => _imageUrl;
  void setImageUrl(String? imageUrl) {
    _imageUrl = imageUrl;
    notifyListeners();
  }

  // Function to capture image from camera
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setImage(File(pickedFile.path));

      debugPrint("Image selected: $_image");
      Utils.toastSuccessMessage("image selected now upload");
    } else {
      Utils.toastErrorMessage("Image not selected");
    }
    notifyListeners();
  }

  // Function to upload the image to Firebase Storage
  Future uploadImageToFirebase() async {
    setUploadLoading(true);
    if (_image == null) {
      setUploadLoading(false);
      Utils.toastErrorMessage("Image not selected");
      return;
    }
    try {
      String fileName = DateTime.now().toString();
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      // Get the URL of the uploaded image
      _imageUrl = await taskSnapshot.ref.getDownloadURL();
      debugPrint("Image uploaded and URL/////////////////////=>: $_imageUrl");
      setUploadLoading(false);
      Utils.toastSuccessMessage("image uploaded");
    } catch (e) {
      setUploadLoading(false);

      Utils.toastErrorMessage("Error uploading image$e");
      debugPrint("Error uploading image: $e");
    }
  }

  setImageToNull() {
    _image = null;
    _imageUrl = null;
    notifyListeners();
  }
}
