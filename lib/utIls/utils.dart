import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void toastErrorMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        fontSize: 14);
  }

  static void toastSuccessMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        fontSize: 14);
  }
}
