
import 'package:flutter/material.dart';


class AppNavigationDrawer extends StatefulWidget {
  @override
  _AppNavigationDrawerState createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        width: 250,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  //Color(0xff4367b1)
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(110),
                      child: Image.network("https://picsum.photos/200/300", fit: BoxFit.cover)),
                  accountName: const Text(
                    'Mr AR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      //color: Colors.grey[300],
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: const Text(
                    'ar@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "User",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  leading: const Icon(
                    Icons.person,
                    size: 24.0,
                    color: Colors.blue,
                  ),
                  children: [
                    ListTile(
                       leading: const Icon(
                        Icons.data_usage_sharp,
                        size: 24.0,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        
                      },
                     
                    ),
                    ListTile(
                       leading: const Icon(
                        Icons.message,
                        size: 24.0,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'New Message',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Server())));
                      },
                     
                    ),
                    ListTile(
                      title: const Text(
                        'Tasks',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                    
                      },
                      leading: const Icon(
                        Icons.note_alt,
                        size: 24.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
