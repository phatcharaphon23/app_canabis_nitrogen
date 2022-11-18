import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tflite/tflite.dart';
import 'package:tflite_image_classification/TEST_Image/constants.dart';
import 'package:tflite_image_classification/TEST_Image/screens/details/details_screen.dart';

import 'image_and_icons.dart';

class Body1 extends StatefulWidget {
  @override
  State<Body1> createState() => _MyBody1State();
}

class _MyBody1State extends State<Body1> {
  File? _file;
  ImagePicker image = ImagePicker();
  bool loading = true;

  var output;
  var label;
  var fine;
  final imagepicker = ImagePicker();
  var gfg = {
    '0 Healthyt_N': 'Class 1',
    '1 Early_N_Def': 'Class 2',
    '2 Prog_N_Def': 'Class 3',
    '3 Late_N_Def': 'Class 4',
  };

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }

  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  Future getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) {
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(''),
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                content: Text(
                  '  No Image ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
                actions: <Widget>[
                  TextButton(
                      child: Text('Close'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen()));
                      }),
                ],
              ));
    } else {
      File image = File(pickedFile.path);
      imageClassification(image);
    }
    ;
  }

  Future getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) {
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(''),
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                content: Text(
                  '  No Image ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                ),
                actions: <Widget>[
                  TextButton(
                      child: Text('Close'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen()));
                      }),
                ],
              ));
    } else {
      File image = File(pickedFile.path);
      imageClassification(image);
    }
    ;
  }

  @override
  void dispose() {
    super.dispose();
  }

  // getImageFromCamera() async {
  //   var img = await image.pickImage(source: ImageSource.camera);

  //   setState(() {
  //     _file = File(img!.path);
  //   });
  //   //detectimage(_file!);
  //   return (_file);
  // }

  // getImageFromGallery() async {
  //   var PickerImage = await image.pickImage(source: ImageSource.gallery);

  //   setState(() async {
  //     _file = File(PickerImage!.path);

  //     ;
  //   });
  //   //detectimage(_file!);
  //   return (_file);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          // ignore: prefer_const_constructors
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(12),
                  child: Image.file(
                    _image,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: const Opacity(
                    opacity: 0.8,
                    child: Center(
                      child: Text("No image selected"),
                    ),
                  ),
                ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " CLASS                     ACCURACY",
                    style: TextStyle(fontSize: 25, color: Colors.amber),
                  ),
                ),
              ],
            ),
          ),

          // ClipRRect(
          //   borderRadius: BorderRadius.circular(4),
          //   child: Stack(
          //     children: <Widget>[
          //       Positioned.fill(
          //         child: Container(
          //           decoration: const BoxDecoration(
          //               gradient: LinearGradient(colors: <Color>[
          //             Color.fromARGB(255, 17, 140, 3),
          //            // Color.fromARGB(255, 67, 240, 48),
          //             Color.fromARGB(255, 174, 241, 171),
          //           ])),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 60,
          //         child: TextButton(
          //           style: TextButton.styleFrom(
          //             foregroundColor: Colors.white,
          //             padding: const EdgeInsets.all(16.0),
          //             textStyle: const TextStyle(fontSize: 20),
          //           ),
          //           onPressed: () {
          //             if (_image == "") {
          //             } else if (_image == "") {
          //             } else if (_image == "") {
          //             } else if (_image == "") {}
          //           },
          //           child: const Text('วิธีเเเก้ไข'),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "${result['label']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 57, 244, 54),
                                      fontSize: 20),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "                            ${result['confidence'].toStringAsFixed(4)}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 57, 244, 54),
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          ),

          const SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  style: TextButton.styleFrom(
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: kPrimaryColor),
                  onPressed: getImageFromCamera,
                  child: const Text(
                    "Camera",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  style: TextButton.styleFrom(
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      foregroundColor: Colors.black,
                      backgroundColor: kPrimaryColor),
                  onPressed: getImageFromGallery,
                  child: const Text(
                    "Gallery",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
