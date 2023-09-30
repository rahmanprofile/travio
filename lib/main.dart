import 'package:flutter/material.dart';
import 'package:travio/first_desgin.dart';
import 'package:travio/second_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'travio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstDesign(),
     // home: const FirstDesign(),
     // home: const SecondDesign(),
    );
  }
}
