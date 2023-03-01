import 'package:flutter/material.dart';
import 'package:simple_calculator/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
