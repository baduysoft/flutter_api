import 'package:flutter/material.dart';
import 'package:flutter_api/model/post.dart';

import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Post? post;
  User? user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("API Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(post != null
                  ? "${post?.id} | ${post?.name} | ${post?.job} | ${post?.created}"
                  : "Tidak ada data"),
              Text(user != null
                  ? "${user?.id} | ${user?.name}"
                  : "Tidak ada data"),
              ElevatedButton(
                onPressed: () {
                  Post.connectToApi("Moch Diki Widianto", "Programmer")
                      .then((value) {
                    post = value;
                    setState(() {});
                  });
                  User.connectToApi('5').then((value) {
                    user = value;
                    setState(() {});
                  });
                },
                child: const Text("POST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
