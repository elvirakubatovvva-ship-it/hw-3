import 'package:flutter/material.dart';
import 'calculateScreen.dart';

class CalculateApp extends StatelessWidget {
  const CalculateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CalculateScreen(),
    );
  }
}