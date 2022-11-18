import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tflite_image_classification/TEST_Image/data/canabisdata.dart';
import 'package:tflite_image_classification/TEST_Image/treatscreen/AllTreat.dart';

import '../../../constants.dart';

import 'image_slider.dart';

class ImageAndIcons extends StatefulWidget {
  const ImageAndIcons({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  State<ImageAndIcons> createState() => _ImageAndIconsState();
}

class _ImageAndIconsState extends State<ImageAndIcons> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: IconButton(
                    //     icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: kDefaultPadding),
                    //     onPressed: () {},
                    //   ),
                    // ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 15),
                            blurRadius: 22,
                            color: kPrimaryColor.withOpacity(0.22),
                          ),
                          // ignore: prefer_const_constructors
                          BoxShadow(
                            offset: const Offset(-15, -15),
                            blurRadius: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Align(
                        // alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: SvgPicture.asset("assets/icons/list-check.svg"),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CanData()));
                          },
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 15),
                            blurRadius: 22,
                            color: kPrimaryColor.withOpacity(0.22),
                          ),
                          // ignore: prefer_const_constructors
                          BoxShadow(
                            offset: const Offset(-15, -15),
                            blurRadius: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Align(
                        // alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/icons/hand-holding-heart.svg"),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          onPressed: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllTreat()));
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 15),
                            blurRadius: 22,
                            color: kPrimaryColor.withOpacity(0.22),
                          ),
                          // ignore: prefer_const_constructors
                          BoxShadow(
                            offset: const Offset(-15, -15),
                            blurRadius: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Container(
                        child: Align(
                          // alignment: Alignment.topLeft,

                          child: IconButton(
                            icon:
                                SvgPicture.asset("assets/icons/globe (1).svg"),
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                           onPressed: () => setState(() {
                                  if (context.locale.languageCode == 'en') {
                                    context.setLocale(Locale('th'));
                                  } else {
                                    context.setLocale(Locale('en'));
                                  }
                                }),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 15),
                            blurRadius: 22,
                            color: kPrimaryColor.withOpacity(0.22),
                          ),
                          // ignore: prefer_const_constructors
                          BoxShadow(
                            offset: const Offset(-15, -15),
                            blurRadius: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      child: Align(
                        // alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: SvgPicture.asset("assets/icons/power.svg",
                              height: 80, width: 80, fit: BoxFit.scaleDown),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                           onPressed: () {
                             if (Platform.isAndroid){
                              SystemNavigator.pop();
                             }else{
                              exit(0);
                             }
                           },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ImgeSlider(),
          ],
        ),
      ),
    );
  }
}
