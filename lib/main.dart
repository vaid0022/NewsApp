import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:newsspp/Logics/NavigationBar.dart';
import 'package:newsspp/Providers/Provider.dart';
import 'package:newsspp/screens/Catagories.dart';
import 'package:newsspp/screens/splashscreen.dart';
import 'package:newsspp/widgets/shimmerWidget.dart';
import 'package:provider/provider.dart';



void main(){
  //DevicePreview(builder: (context)=>
  runApp(ChangeNotifierProvider(create: (_)=>ThemeProvider(),
      child:News()));
}


class News extends StatelessWidget {
   News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NewsApp",
      theme: ThemeData(
        brightness: Brightness.light,
        cardTheme: CardThemeData(color: Colors.white38)

      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
        cardTheme: CardThemeData(color: Colors.white10)
      ),
      themeMode: Provider.of<ThemeProvider>(context,listen: true).getTheme() ? ThemeMode.dark : ThemeMode.light,


        home:Splashscreen(),
    );
  }
}


