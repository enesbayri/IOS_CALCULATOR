import 'package:flutter/material.dart';
import 'package:flutter_application_12/Pages/HomePage.dart';
import 'package:flutter_application_12/ui_helper/ui_ColorHelper.dart';

void main() {
  runApp(const CalcuteApp());
}

class CalcuteApp extends StatelessWidget {
  const CalcuteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "sfLight",
        colorScheme: ColorScheme.fromSeed(seedColor: ColorHelper.SeedColor),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
