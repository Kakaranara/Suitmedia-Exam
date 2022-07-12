// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:suitmedia_test/constant/colors.dart';
import 'package:suitmedia_test/first.dart';
import 'package:suitmedia_test/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(colorScheme: ColorScheme.light(primary: mainColors())),
        home: FirstScreen());
  }
}
