import 'package:flutter/material.dart';
import 'popups/about.dart';
import 'popups/contact.dart';
import 'popups/hello.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
      routes: {
        '/hello': (context) => const HelloScreen(),
        '/contact': (context) => const ContactScreen(),
        '/about': (context) => const AboutScreen()
      },
    );
  }
}
