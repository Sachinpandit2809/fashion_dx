import 'package:fashion_dx/screen_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash/splash_screeen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> AuthController())
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    ),

    );
  }
}
