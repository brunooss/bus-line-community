import 'package:flutter/material.dart';

import 'package:bus_line_community/pages/chat_page.dart';
import 'package:bus_line_community/pages/map_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // First page by default
  int bottomNavigationBarIndex = 0;
  late List<Widget> pages = <Widget>[
    MapPage(),
    ChatPage(),
    // ChatPage(),
    const Text(
      'Index 2: Abuoooobuoraaaaa',
    ),

  ];
  late Widget currentPage = pages[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rede Social dos Busao"),
      ),


      body: Center(
        child: currentPage,
      ),


      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapa"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Abuooobuoraaaa"),
        ],
        onTap: (int index) {
          setState(() {
            bottomNavigationBarIndex = index;
            currentPage = pages.elementAt(bottomNavigationBarIndex);
          });
        },
        currentIndex: bottomNavigationBarIndex,
      ),
    );
  }
}