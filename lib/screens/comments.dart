import 'package:flutter/material.dart';
import 'package:instagram_copy/components/comment_item.dart';
import 'package:instagram_copy/dtos/Comment.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({Key? key}) : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

//create comments id
class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text("Comments"),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_outlined),
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView.builder(
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return  CommentItem(comment: Comment("Rafael","assets/images/profile.jpg",1,"comentario muito top bla hgsygasyasyas sbhggs8adgasibd a bsabdsaudhuisd ioasdisaiod jsaopdksad kaspdkopaskdopas opkasd opkasd opkasodk as kdasopd askopsak jsauhsuhsauhshua ashuashushuhsuhua ashusha"),);
          },
        ),
      ),
    );
  }
}
