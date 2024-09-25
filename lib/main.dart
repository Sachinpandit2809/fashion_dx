import 'package:fashion_dx/screen_controller/authController/auth_controller.dart';
import 'package:fashion_dx/screen_controller/authController/firebase_auth_controller.dart';
import 'package:fashion_dx/screen_controller/screenController/add_product_controller.dart';
import 'package:fashion_dx/screen_controller/services/image_controller.dart';
// import 'package:fashion_dx/screens/home/add_product_screen.dart';
import 'package:fashion_dx/screens/home/edit_product_screen.dart';
import 'package:fashion_dx/screens/home/fashion_home_screen.dart';
import 'package:fashion_dx/screens/home/upload_image.dart';
import 'package:fashion_dx/screens/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash/splash_screeen.dart';
import 'firebase_options.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (_) => ImageController()),
        ChangeNotifierProvider(create: (_) => AddProductController()),
        ChangeNotifierProvider(create: (_) => FirebaseAuthController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const FashionHomeScreen(),
      ),
    );
  }
}
