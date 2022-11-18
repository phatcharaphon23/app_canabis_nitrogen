import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class IntroPage1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          children: [
            Container(
              child: Lottie.network(
                  "https://assets1.lottiefiles.com/packages/lf20_hAvF1pS1pb.json"),
            ),
            Container(
              child: Text(
                'Welcome to project !',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
