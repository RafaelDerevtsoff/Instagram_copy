import 'package:flutter/material.dart';
import 'package:instagram_copy/components/post_Item.dart';

import 'package:instagram_copy/dtos/post_dto.dart';
Future<void> onRefresh() async {
  return Future.delayed(const Duration(seconds: 2));
}

class Home extends StatefulWidget {
  const Home(this._posts, {Key? key}) : super(key: key);
  final List<Post> _posts;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.black,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView.builder(
          itemCount: widget._posts.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return PostItem(
              imageUrl: widget._posts[index].imageUrl,
              username: widget._posts[index].username,
              description: widget._posts[index].description,
            );
          },
        ),
      ),
    );
  }
}
