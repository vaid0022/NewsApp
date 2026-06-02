import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:newsspp/Logics/NavigationBar.dart';
import 'package:newsspp/screens/Catagories.dart';
import 'package:newsspp/widgets/shimmerWidget.dart';

void main(){
  //DevicePreview(builder: (context)=>
  runApp(
     News());
}


class News extends StatelessWidget {
   News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NewsApp",
      home:Home(),
    );
  }
}


