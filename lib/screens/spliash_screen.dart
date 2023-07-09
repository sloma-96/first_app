import 'dart:async';

import 'package:first_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => const HomeScrean()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quran_vactor.png',
            // semanticsLabel: 'A shark?!',
            // placeholderBuilder: (BuildContext context) => Container(
            //     padding: const EdgeInsets.all(30.0),
            //     child: const CircularProgressIndicator()),
          ),
          const Text(
            "مرحبا بك في تطبيق مصحف الإلكتروني",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
