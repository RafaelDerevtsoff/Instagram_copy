import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instagram_copy/components/ProfilePhoto.dart';
import 'package:instagram_copy/dtos/Comment.dart';

class CommentItem extends StatefulWidget {
  CommentItem({Key? key, required this.comment}) : super(key: key);
  Comment comment;

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  _calculatePaddingLike(){

  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ProfilePhoto(
                  profilePhotoPath: widget.comment.profilePhotoPath,
                  width: 55,
                  height: 55),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: AutoSizeText(
                      "            ${widget.comment.comment}",
                      wrapWords: false,
                      style: const TextStyle(fontSize: 15),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      presetFontSizes: const [15],
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => Future.microtask(() => Navigator.push(context, MaterialPageRoute(builder: (context)=> (username: widget.comment.username)))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                        child: Text(
                          widget.comment.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 55, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                           backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.center),
                        child: Text(
                          "likes ${widget.comment.likeCount}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () =>
                            setState(() => widget.comment.likeCount++),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.username}) : super(key: key);
  final String username;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
