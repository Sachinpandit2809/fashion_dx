import 'package:fashion_dx/screen_controller/authController/auth_controller.dart';
import 'package:fashion_dx/screen_controller/authController/firebase_auth_controller.dart';
import 'package:fashion_dx/screen_controller/screenController/product_controller.dart';
import 'package:fashion_dx/screen_controller/services/image_controller.dart';
import 'package:fashion_dx/screens/details_screen/product_cart_screen.dart';
import 'package:fashion_dx/screens/details_screen/product_checkout_screen.dart';
import 'package:fashion_dx/screens/details_screen/product_details_screen.dart';
import 'package:fashion_dx/screens/details_screen/product_payment_screen.dart';
// import 'package:fashion_dx/screens/home/add_product_screen.dart';
import 'package:fashion_dx/screens/home/fashion_home_screen.dart';
import 'package:fashion_dx/screens/orders/delevered_screen.dart';
import 'package:fashion_dx/screens/orders/product_order_screen.dart';
import 'package:fashion_dx/services/local_storage/shared_prefs.dart';
import 'package:fashion_dx/services/local_storage/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil().initLocalServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ImageController(), lazy: true,),
        ChangeNotifierProvider(create: (_) => ProductController(), lazy:  true,),
        ChangeNotifierProvider(create: (_) => FirebaseAuthController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const ProductDetailsScreen(),
      ),
    );
  }
}
