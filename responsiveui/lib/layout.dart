import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {/* 
  //Declear the responsiveness
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;
  //if less than 600px
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800; */

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width<800;
    bool isDesktop = MediaQuery.of(context).size.width >= 800;
    return Scaffold(
      appBar:AppBar(title: Text('App Layout'),),
      drawer: isMobile
      ?const Drawer(
        child: ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Contact'),
        ),
      )
      :null,
      body: isDesktop ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isDesktop)
          Container(
            height: double.infinity,
            width: 350,
            color: const Color.fromARGB(255, 60, 79, 95),
            child: const Center(child: Text('SideBar',style: TextStyle(color: Colors.white,fontSize: 64),)),
          ),
          Expanded(
              child: Container(
                height: double.infinity,
                color: const Color.fromARGB(255, 58, 64, 75),
            child: const Center(child: Text('Main Content',style: TextStyle(color: Colors.white,fontSize: 64),)),
          ))
        ],
      )
      : Column(
        children: [
            Expanded(
              child: Container(
                height: double.infinity,
                color: const Color.fromARGB(255, 58, 64, 75),
            child: const Center(child: Text('Main Content',style: TextStyle(color: Colors.white,fontSize: 64),)),
          ))
        ],
      )
    );
  }
}
