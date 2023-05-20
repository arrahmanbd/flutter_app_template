import 'package:flutter/material.dart';
import 'package:responsiveui/builder.dart';
import 'package:responsiveui/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orkitt Layout Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveLayout(),
    );
  }
}
