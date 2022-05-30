import 'package:flutter/material.dart';
class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key, required this.profilePhotoPath, required this.width, required this.height}) : super(key: key);
  final String profilePhotoPath;
  final double width;
  final double height;
  //assets/images/profile.jpg
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(profilePhotoPath),
          )),
    );
  }
}
