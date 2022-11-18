import 'package:flutter/material.dart';

import 'header_with_searchbox.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[HeaderWithSearchBox(size: size)],
      ),
    );
  }
}
