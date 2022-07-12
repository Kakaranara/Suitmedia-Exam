// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/constant/colors.dart';
import 'package:suitmedia_test/first.dart';
import 'package:suitmedia_test/namestate/cubit/name_cubit.dart';
import 'package:suitmedia_test/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NameCubit(),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  elevation: 1,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black),
              colorScheme: ColorScheme.light(primary: mainColors()),
            ),
            home: FirstScreen()),
      ),
    );
  }
}
