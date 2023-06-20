import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/pages/init_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YouApp",
      debugShowCheckedModeBanner: false,
      home: InitPage(),
    );
  }
}