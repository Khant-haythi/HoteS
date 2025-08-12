import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '2_application/pages/onboardwidget.dart';
import 'firebase_option.dart';
 // Your Onboarding01Widget

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hote Shin App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Use a consistent theme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter', // Optional: add Google Fonts later
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ✅ Directly show your onboarding screen
      home: const Onboarding01Widget(),
    );
  }
}