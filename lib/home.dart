import 'package:flutter/material.dart';
import 'package:motivation/drawer_Detail.dart';
import 'card1.dart';
import 'card2.dart';

import 'package:motivation/drawer_screen.dart';

// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Add state variables and functions
  int _selectedIndex = 0;
// 8
  static List<Widget> pages = <Widget>[
    // TODO: Replace with Card1
    const Card1(),

    //Container(color: Colors.red),
    // TODO: Replace with Card2
    Card2(),

    Container(color: Color.fromARGB(255, 170, 175, 76)),
    // TODO: Replace with Card3
    Container(color: Colors.blue)
  ];
// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: const BoxDecoration(
                // 4
                image: DecorationImage(
                  // 5
                  image: AssetImage('assets/motivational2.jpg'),
                  // 6
                  fit: BoxFit.cover,
                ),
                // borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                'Inspirational Speech',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             DrawerDetail(drawerscreen)));
                      },
                      icon: Icon(Icons.security)),
                  const Text('About'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // print("Prompt the user to enter something");
                      },
                      icon: Icon(Icons.help)),
                  const Text('Help'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // print("Prompt the user to enter something");
                      },
                      icon: Icon(Icons.logout)),
                  const Text('Sign Out'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        // backgroundColor: Colors.teal,
        backgroundColor: Colors.orange,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Motivational Speech',
              // 2
              style: Theme.of(context).textTheme.headline6,
            ),
            IconButton(
                onPressed: () {
                  // print("Prompt the user to enter something");
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  // print("add edit and some other things");
                },
                icon: Icon(Icons.more_vert))
          ],
        ),
      ),

      // TODO: Show selected tab
      body: pages[_selectedIndex],
      // TODO: Add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        // 5
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // TODO: Set selected tab bar
        currentIndex: _selectedIndex,
// 11
        onTap: _onItemTapped,
        // 6
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Author',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
