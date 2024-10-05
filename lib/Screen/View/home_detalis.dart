
import 'package:flutter/material.dart';
import 'package:riverpod_project/Model/user_list_response.dart';

class HomeDetalis extends StatelessWidget {
  const HomeDetalis({super.key, this.e});

  final UserDataModel? e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${e?.name}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(13)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("${e?.userDataType?.name}"), 
                Text("${e?.id}"), 
                Text("${e?.email}"),
                Text("${e?.phone}"),
                Text("${e?.createdAt}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}