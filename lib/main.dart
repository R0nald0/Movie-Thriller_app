import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:the_movie/MyApp.dart';

void main() async {
   await initialiaps();
  runApp(const MyApp());
}

Future<void> initialiaps() async {
   await dotenv.load( fileName: '.env');
}
