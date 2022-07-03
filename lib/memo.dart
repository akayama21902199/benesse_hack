import 'package:flutter/material.dart';

class Memo extends StatelessWidget {
  const Memo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("○○メモ"),
        actions: [
          IconButton(
            icon: const Icon(Icons.star), onPressed: () {  },
          ),
        ],
      ),
      body: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              child: Text(
                '~覚えるべきポイント~',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text('今回のテストでは..........'),
            SizedBox(
              width: double.infinity,
              child: Text(
                '~ここに注意！~',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text('この問題には引っかけポイントがあって..........'),
            SizedBox(
              width: double.infinity,
              child: Text(
                '~覚え方~',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text('これは歌を作って..........'),
          ],
        )
      );
  }
}














