import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldnumber/screen/home.dart';
import 'package:goldnumber/widget/splash_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    tz.initializeTimeZones();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(149, 76, 233, 1),
          primaryColorDark: Color.fromRGBO(149, 76, 233, 1),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashScreen(),
        '/screen0': (BuildContext context) => Home(),
      },
      ),
    );
  }
}
