import 'package:flutter/material.dart';

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

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Builder'),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, size) {
        if (size.maxWidth < 600) {
          //Display as a Column on Mobile
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 320,
                color: const Color.fromARGB(255, 60, 79, 95),
                child: const Center(
                    child: Text(
                  'SideBar',
                  style: TextStyle(color: Colors.white, fontSize: 34),
                )),
              ),
              Expanded(
                  child: Container(
                color: const Color.fromARGB(255, 58, 64, 75),
                child: const Center(
                    child: Text(
                  'Main Content',
                  style: TextStyle(color: Colors.white, fontSize: 34),
                )),
              ))
            ],
          );
        } else {
          //Display as a Row on Desktop
          return Row(
            children: [
              Container(
                height: double.infinity,
                width: 350,
                color: const Color.fromARGB(255, 60, 79, 95),
                child: const Center(
                    child: Text(
                  'SideBar',
                  style: TextStyle(color: Colors.white, fontSize: 34),
                )),
              ),
              Expanded(
                child: LayoutBuilder(builder: (context, size) {
                  final isSmall = size.maxWidth < 800;
                  //When small enable Black Color else Blue Color
                  return Container(
                    color: isSmall ? Colors.black : Colors.blue,
                    child: const Center(
                        child: Text(
                      'Main Content',
                      style: TextStyle(color: Colors.white, fontSize: 34),
                    )),
                  );
                }),
              )
            ],
          );
        }
      }),
    );
  }
}
