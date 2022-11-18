import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';


class AllTreat extends StatefulWidget {
 
  @override
  State<AllTreat> createState() => _AllTreat();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class _AllTreat extends State<AllTreat> {
  String BarText = 'app.PerBar';
  String CanText = 'app.PerText';
  void ClickText1() {
    setState(() {
      BarText = 'app.PerBar';
      CanText = 'app.PerText';
    });
  }

  void ClickText2() {
    setState(() {
      BarText = 'app.SickBar';
      CanText = 'app.SickText';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Text(BarText).tr(),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Material(
            color: const Color(0xffff8989),
            child: InkWell(
              onTap: () {
                ClickText1();
              },
              child: const SizedBox(
                height: kToolbarHeight,
                width: 195,
                child: Center(
                  child: Text(
                    'Perfect Canabis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: const Color(0xffff8906),
              child: InkWell(
                onTap: () {
                  ClickText2();
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Sick Canabis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/qwe.jpg",
                        scale: 5.0,
                      ),
                      Text(CanText).tr(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
