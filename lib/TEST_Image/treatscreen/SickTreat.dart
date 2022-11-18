import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SickTreat extends StatefulWidget {


  @override
  State<SickTreat> createState() => _SickTreat();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class _SickTreat extends State<SickTreat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Text('app.SickBar').tr(),
        ),
      ),
      body: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('th')],
        path: 'assets/lang',
        child: Container(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/qwe.jpg",
                      scale: 5.0,
                    ),
                    Text('app.SickText').tr(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}