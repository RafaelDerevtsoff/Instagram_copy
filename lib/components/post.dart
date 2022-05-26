import 'package:flutter/material.dart';
import 'package:instagram_copy/components/ProfilePhoto.dart';

import '../animations/heart_animation_widget.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key, required this.username, required this.description, required this.imageUrl}) : super(key: key);

  final String username ;
  final String imageUrl ;
  final String description ;
  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isHeartAnimating = false;
  bool isLiked = false;
  bool isSaved = false;
  // "https://cdn.pixabay.com/photo/2017/04/27/08/29/man-2264825_960_720.jpg"
  // https://cdn.pixabay.com/photo/2019/11/30/17/23/girl-4663708_960_720.jpg

  @override
  Widget build(BuildContext context) => buildImage();

  Widget buildImage() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const ProfilePhoto(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.username,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  widget.imageUrl,
                  fit: BoxFit.scaleDown,
                ),
                Opacity(
                  opacity: isHeartAnimating ? 1 : 0,
                  child: HeartAnimationWidget(
                    duration: const Duration(milliseconds: 300),
                    onEnd: () => setState(() => isHeartAnimating = false),
                    isAnimating: isHeartAnimating,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
            onDoubleTap: () {
              setState(() {
                isHeartAnimating = true;
                isLiked = true;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
            child: Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: isLiked
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    if (isLiked == false) {
                      setState(() => isLiked = true);
                    } else {
                      setState(() => isLiked = false);
                      isLiked = false;
                    }
                  },
                  color: this.isLiked ? Colors.red : null,
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.chat),
                  onPressed: () {},
                  color: Colors.black,
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.send_outlined),
                  onPressed: () {},
                  color: Colors.black,
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: isSaved
                      ? const Icon(Icons.bookmark_outline)
                      : const Icon(Icons.bookmark),
                  onPressed: () {
                    if (isSaved == false) {
                      setState(() => isSaved = true);
                    } else {
                      setState(() => isSaved = false);
                      isSaved = false;
                    }
                  },
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => print("Go to likes persons "),
                        child: const Text("Liked by"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: InkWell(
                          child: const Text(
                            "Last liked user",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () => print("last liked profile"),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: InkWell(
                          onTap: () => print("others"),
                          child: const Text("and others"),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      child:  Text(
                        widget.username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () => print("Go to profile"),
                    ),Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: InkWell(child: Text(widget.description),onTap: () => print("Go to comments"),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
