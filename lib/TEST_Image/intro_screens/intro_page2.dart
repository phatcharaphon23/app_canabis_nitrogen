import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class IntroPage2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Lottie.network(
                    "https://assets7.lottiefiles.com/packages/lf20_srxq15lc.json"),
              ),
              Container(
                child: Text(
                  'Nitrogen deficiency detection',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'system in cannabis leaves',
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ),
            ],
          ),
          //system in cannabis leaves
        ),
      ),
    );
  }
}
