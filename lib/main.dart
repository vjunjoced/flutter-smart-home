import 'package:flutter/material.dart';
import 'package:smart_home_iot/src/pages/detail_page.dart';
import 'package:smart_home_iot/src/pages/main_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home IOT',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainPage(),
        'detail': (BuildContext context) => DetailPage()
      },
    );
  }
}