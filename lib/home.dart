import 'package:flutter/material.dart';


@override
class MyHomePageState extends StatelessWidget {
  const MyHomePageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle), onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text(
            "ここにみんなの投稿が流れる"
        ),
      ),
    );
  }
}
