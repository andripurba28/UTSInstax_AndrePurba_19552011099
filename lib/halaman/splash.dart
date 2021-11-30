import 'dart:async';

import 'package:flutter/material.dart';

import 'halaman_utama.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override 
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 3);
   Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HalamanUtama()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Center(child: Image.asset('assets/fujifilm.png', height: 50)),
            Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Made With ',
                  style: TextStyle(color: Colors.black),
                  children: const <InlineSpan>[
                    WidgetSpan(
                      child: Icon(Icons.favorite, size: 14, color: Colors.red),
                    ),
                    TextSpan(text: '|'),
                    WidgetSpan(
                      child:
                          Icon(Icons.copyright, size: 14, color: Colors.black),
                    ),
                    TextSpan(text: ' ANDRE PURBA'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}