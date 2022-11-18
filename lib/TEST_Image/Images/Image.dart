import 'dart:async';

import 'package:flutter/material.dart';

class Image_Home extends StatefulWidget {


  @override
  State<Image_Home> createState() => _Image_HomeState();
}

class _Image_HomeState extends State<Image_Home> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(context, '//', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
     
        children: [
          SizedBox(
            height: 300,
          ),
          Center(
            
            child: Image.asset("assets/logo1.png"),
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
