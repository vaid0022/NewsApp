import 'package:flutter/material.dart';

import '../screens/Catagories.dart';
import '../screens/HomePage.dart';
import '../screens/detailNews.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _SelectedIndex = 0;
  _BottomNavigationBar(int index){
    setState(() {
      _SelectedIndex = index;
    });
  }
  final List<Widget> _pages = [
    Homepage(),
    Catagories(),
    detailnews(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _SelectedIndex,
          onTap: _BottomNavigationBar,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.lightBlueAccent,
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home,") ,
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper,),label: "News"),
          ] ),

      body: _pages[_SelectedIndex],
    );
  }
}
