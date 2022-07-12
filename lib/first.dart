import 'package:flutter/material.dart';
import 'package:suitmedia_test/second.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final stringController = TextEditingController();
  final palingdrome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/background.png"), fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(32),
          child: SafeArea(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _image(),
                  _hugeSpace(),
                  _inputTempate(controller: stringController, name: "Name"),
                  _space(),
                  _inputTempate(controller: palingdrome, name: "Palindrome"),
                  _hugeSpace(),
                  _button(text: "CHECK", onpress: () {}),
                  _lilSpace(),
                  _button(
                      text: "NEXT",
                      onpress: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SecondScreen()));
                      })
                ],
              ),
            ),
          )),
    );
  }

  Widget _lilSpace() {
    return const SizedBox(
      height: 6,
    );
  }

  Widget _space() {
    return const SizedBox(
      height: 15,
    );
  }

  Widget _hugeSpace() {
    return const SizedBox(
      height: 35,
    );
  }

  Widget _button({required String text, required VoidCallback onpress}) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(text),
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  Widget _image() {
    return Container(
      height: 100,
      width: 100,
      child: CircleAvatar(
        child: Image.asset("res/ic_photo.png"),
      ),
    );
  }

  Widget _inputTempate(
      {required TextEditingController controller, required String name}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: name,
          filled: true,
          fillColor: Colors.white),
    );
  }
}
