import 'package:flutter/material.dart';

import '../screens/Catagories.dart';
import '../screens/HomePage.dart';
import '../screens/detailNews.dart';
import '../screens/news.dart';
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
      appBar: AppBar(
          title: Text('NewsApp'), centerTitle: true),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _SelectedIndex,
          onTap: _BottomNavigationBar,
          type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home") ,
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "NewsCategory"),
            BottomNavigationBarItem(icon: Icon(Icons.video_label_rounded),label: "NewsVideo"),
          ] ),

      body: _pages[_SelectedIndex],
    );
  }
}
