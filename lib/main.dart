import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tflite_image_classification/TEST_Image/intro_screens/start.dart';


import 'TEST_Image/screens/details/details_screen.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('th')],
      path:'assets/lang',
      fallbackLocale: Locale('th'),
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>  MyWidget(),
        '//': (context) => DetailsScreen(),
      },
    );
  }
}
