

class Comment{
  final int id;
  final String username;
  final String profilePhotoPath;
  final String comment;
  int likeCount = 0;

  Comment(this.username, this.profilePhotoPath, this.id, this.comment);

}