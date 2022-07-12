// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Second Screen"),
      ),
      bottomNavigationBar: _bottomNavbar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome"),
            Text("John Doe"),
            Expanded(
              child: Center(
                child: Text(
                  "Selected User Name",
                  style: style,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomNavbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        child: Text("Choose a User"),
        onPressed: () {},
      ),
    );
  }
}
