import 'package:fashion_dx/screens/auth/forget_password_screen.dart';
import 'package:fashion_dx/screens/auth/varification_screen.dart';
import 'package:fashion_dx/utIls/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FirebaseAuthController with ChangeNotifier {
  Future<void> phoneNumberLogin(String number, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
        phoneNumber: '+91$number',
        verificationCompleted: (PhoneAuthCredential p) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String varificationId, int? token) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VarificationScreen(
                        verificationId: varificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (String varificationId) {});
  }

  Future<void> verifyOtp(
      {required verificationId,
      required String smsCode,
      required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      FirebaseAuth.instance.signInWithCredential(credential).then((onValue) {
        Utils.toastSuccessMessage("otp verified! Welcome user!");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ForgetPasswordScreen()));
      });
    } catch (e) {
      Utils.toastErrorMessage("Wrong Otp, try again?");
    }
  }
}
