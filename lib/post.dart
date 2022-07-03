import 'package:flutter/material.dart';

class MemoContentPostScreen extends StatelessWidget {
  static const String id = 'memo_content_post_screen';

  MemoContentPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Text('メモ投稿画面'),
        ),
        body: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.85,
                      child: const TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "title",

                        ),
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            //ここまで子0
            SizedBox(
                width: double.infinity,
                child: Column(
/*                crossAxisAlignment: CrossAxisAlignment.start,*/
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "覚えるべきポイント",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.85,
                      child: const TextField(
                        decoration: InputDecoration(),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            //ここまで子1
            SizedBox(
                width: double.infinity,
                child: Column(
/*                crossAxisAlignment: CrossAxisAlignment.start,*/
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "覚え方",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.85,
                      child: const TextField(
                        decoration: InputDecoration(),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 30,),
            //ここまで子2
            SizedBox(
                width: double.infinity,
                child: Column(
/*                crossAxisAlignment: CrossAxisAlignment.start,*/
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "ここは注意!!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.85,
                      child: const TextField(
                        decoration: InputDecoration(),
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 50,),
            //ここまで子3
            TextButton(
                child: const Text("Register"),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName("/home"));
                }
            ),
          ],
        )
    );
  }
}