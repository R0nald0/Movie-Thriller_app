import 'package:flutter/material.dart';
import 'package:the_movie/themes/myTheme.dart';
import 'package:get/get.dart';
import 'package:the_movie/view/HomePage.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      theme: fistThema,
    );
  }
}


