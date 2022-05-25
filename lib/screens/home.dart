import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: onRefresh, child: ListView(children: [Text("test")],));
  }
}

Future<void> onRefresh() async {
  return Future.delayed(Duration(seconds: 2));
}
