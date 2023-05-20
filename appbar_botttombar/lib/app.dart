import 'package:flutter/material.dart';
import 'bottomtabs/screenA.dart';
import 'bottomtabs/screenB.dart';
import 'drawer/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  var selectedItem = '';
//BottomBar
  int _tabs = 0;
  final List _screens = [
    {"screen": const ScreenA(), "title": "Home Page"},
    {"screen": const ScreenB(), "title": "Settings"}
  ];

  _changeTab(int index) {
    setState(() {
      _tabs = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_tabs]["title"]),
        centerTitle: true,
        actions: [
          PopupMenuButton(onSelected: (value) {
            setState(() {
              selectedItem = value.toString();
            });
            print(value);
            Navigator.pushNamed(context, value.toString());
          }, itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                child: Text("Hello"),
                value: '/hello',
              ),
              PopupMenuItem(
                child: Text("About"),
                value: '/about',
              ),
              PopupMenuItem(
                child: Text("Contact"),
                value: '/contact',
              )
            ];
          })
        ],
      ),
      drawer: AppNavigationDrawer(),
      body: _screens[_tabs]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabs,
        onTap: _changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
      // bottomNavigationBar: NavigationBarTheme(
      //     data: NavigationBarThemeData(
      //       indicatorColor: Colors.blue,
      //       labelTextStyle: MaterialStateProperty.all(
      //         const TextStyle(
      //           fontSize: 14,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //     child: NavigationBar(
      //         height: 60,
      //         //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //         selectedIndex: index,
      //         animationDuration: const Duration(seconds: 1),
      //         onDestinationSelected: (index) => setState(() {
      //               this.index = index;
      //             }),
      //         // ignore: prefer_const_literals_to_create_immutables
      //         destinations: [
      //           const NavigationDestination(
      //               icon: Icon(Icons.email_outlined),
      //               selectedIcon: Icon(Icons.email),
      //               label: 'Dashboard'),
      //           const NavigationDestination(
      //               icon: Icon(
      //                 Icons.chat_bubble_outline,
      //                 size: 30,
      //               ),
      //               selectedIcon: Icon(Icons.chat_bubble),
      //               label: 'Chat'),
      //           const NavigationDestination(
      //               icon: Icon(Icons.group_outlined),
      //               selectedIcon: Icon(Icons.group),
      //               label: 'Settings'),
      //         ]),
      //   ),
    
    );
  }
}
