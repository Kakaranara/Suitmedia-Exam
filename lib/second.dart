// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/data/cubit/reqres_cubit.dart';
import 'package:suitmedia_test/namestate/cubit/name_cubit.dart';
import 'package:suitmedia_test/third.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? name = null;

  @override
  void initState() {
    super.initState();
    name = widget.name.isEmpty || widget.name == ""
        ? "Anonymus User"
        : widget.name;
  }

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
            Text("${name}"),
            Expanded(
              child: Center(
                child: BlocBuilder<NameCubit, NameState>(
                  builder: (context, state) {
                    return Text(
                      "${state.nama}",
                      style: style,
                    );
                  },
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
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => ReqresCubit(),
                    child: ThirdScreen(),
                  )));
        },
      ),
    );
  }
}
