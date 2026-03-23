import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculateScreen.dart';

class Calculateapp extends StatelessWidget{
  const Calculateapp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
home: const CalculatorScreen() ,
   );
  }
}