import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsspp/Logics/NavigationBar.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed( Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splashScreen/bgImage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Lottie.asset(
            "assets/splashScreen/splashAnimation.json",
          ),
        ),
      ),
    );
  }
}
