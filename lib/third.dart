import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Third Screen"),
      ),
      body: Center(
        child: _card(),
      ),
    );
  }

  Widget _card() {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(child: Image.asset("res/ic_photo.png")),
        title: Text("First Name"),
        subtitle: Text("Afafaf"),
      ),
    );
  }
}
