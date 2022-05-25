import 'package:flutter/material.dart';
import 'package:instagram_copy/components/ProfilePhoto.dart';

import '../animations/heart_animation_widget.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isHeartAnimating = false;

  bool isLiked = false;

  @override
  Widget build(BuildContext context) => buildImage();

  Widget buildImage() {
    return SizedBox(
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                ProfilePhoto(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "data",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2019/11/30/17/23/girl-4663708_960_720.jpg',
                    fit: BoxFit.cover,
                  ),
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
            padding: const EdgeInsets.fromLTRB(0, 1, 0, 5),
            child: Row(
              children: [
                IconButton(
                  icon: isLiked ? Icon(Icons.favorite):Icon(Icons.favorite_border_outlined) ,
                  onPressed: () {
                    if(isLiked == false) {
                      setState(() => isLiked = true );

                    }else{
                      setState(() => isLiked = false );
                      isLiked = false;
                    }
                  },
                  color: this.isLiked ? Colors.red : null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
