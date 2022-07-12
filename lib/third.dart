import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/data/cubit/reqres_cubit.dart';

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
        title: const Text("Third Screen"),
      ),
      body: Center(
        child: BlocBuilder<ReqresCubit, ReqresState>(
          builder: (context, state) {
            if (state is ReqresInitial) {
              context.read<ReqresCubit>().getData();
              return CenteredIndicator();
            }
            return Text("ok");
          },
        ),
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

  Widget CenteredIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
