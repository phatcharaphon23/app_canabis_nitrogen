import 'package:flutter/material.dart';
import 'package:tflite_image_classification/TEST_Image/screens/details/components/body.dart';


class DetailsScreen extends StatefulWidget {

  @override
  State<DetailsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DetailsScreen> {
  //  pop หน้าโหลดออก
  Future Body() async {
    showDialog(
      context: context,
      builder: ((context) {
        return CircularProgressIndicator();
      }),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body:  Body1(),
    );
  }
}
