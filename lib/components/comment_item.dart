import 'package:flutter/material.dart';
import 'package:instagram_copy/dtos/Comment.dart';

class CommentItem extends StatefulWidget {
   CommentItem({Key? key}) : super(key: key);
  final List<Comment> comments = [];
  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
