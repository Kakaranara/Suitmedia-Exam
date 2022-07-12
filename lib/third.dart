import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/data/cubit/reqres_cubit.dart';
import 'package:suitmedia_test/data/model/Reqres.dart';

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

            List<Reqres> dataState = [];
            bool isLoading = false;
            if (state is ReqresLoading) {
              isLoading = true;
            } else if (state is ReqresLoaded) {
              dataState = state.data;
            }

            if (dataState.isEmpty) {
              return Text("Empty");
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: dataState.length,
              itemBuilder: (c, i) {
                final data = dataState[i];
                return _card(fullName: "${data.first_name} ${data.last_name}");
              },
              separatorBuilder: (c, i) => const SizedBox(
                height: 5,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _card({required String fullName}) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(child: Image.asset("res/ic_photo.png")),
        title: Text("$fullName"),
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
