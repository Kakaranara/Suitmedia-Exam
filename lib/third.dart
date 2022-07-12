import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/constant/widget.dart';
import 'package:suitmedia_test/data/cubit/reqres_cubit.dart';
import 'package:suitmedia_test/data/model/Reqres.dart';
import 'package:suitmedia_test/namestate/cubit/name_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<ReqresCubit>().getData();
        }
      }
    });
  }

  Future<void> checkAll() async {
    context.read<ReqresCubit>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Third Screen"),
        leading: newBackButton(context),
      ),
      body: RefreshIndicator(
        onRefresh: checkAll,
        child: BlocBuilder<ReqresCubit, ReqresState>(
          builder: (context, state) {
            if (state is ReqresInitial) {
              context.read<ReqresCubit>().getData();
              return CenteredIndicator();
            }

            List<Reqres> dataState = [];
            bool isLoading = false;
            bool isListEmpty = false;
            if (state is ReqresLoading) {
              isLoading = true;
              dataState = state.oldData;
            } else if (state is ReqresLoaded) {
              dataState = state.data;
              isListEmpty = state.isListEmpty;
            }

            if (dataState.isEmpty && isLoading == false) {
              return const Center(child: Text("Empty"));
            }

            print("empty ? $isListEmpty");

            return ListView.separated(
              controller: scrollController,
              itemCount: dataState.length +
                  (isLoading ? 1 : 0) +
                  (isListEmpty ? 1 : 0),
              itemBuilder: (c, i) {
                if (i < dataState.length) {
                  final data = dataState[i];
                  return _card(
                      fullName:
                          "${data.first_name ?? ""} ${data.last_name ?? ""}",
                      email: data.email ?? "Tidak ada email",
                      photo: data.avatar ?? "https://via.placeholder.com/150");
                } else if (isListEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No more data"),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                } else {
                  return CenteredIndicator();
                }
              },
              separatorBuilder: (c, i) => const Divider(
                height: 5,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _card(
      {required String fullName,
      required String email,
      required String photo}) {
    return InkWell(
      onTap: () {
        context.read<NameCubit>().changeName(name: fullName);
        Navigator.of(context).pop();
      },
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            "$photo",
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text("$fullName"),
        subtitle: Text("$email"),
      ),
    );
  }

  Widget CenteredIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
