import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../constants.dart';

class ImgeSlider extends StatefulWidget {
  const ImgeSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<ImgeSlider> createState() => _ImgeSliderState();
}

class _ImgeSliderState extends State<ImgeSlider> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                child: Shimmer(
                  child: Container(
                    height: size.height * 0.8,
                    width: size.width * 0.75,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        //topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 60,
                          color: kPrimaryColor.withOpacity(0.29),
                        )
                      ],
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/Nocturnal 420 - NocturnalAbstract_com.jpg"),
                      ),
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
