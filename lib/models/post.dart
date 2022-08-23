

class Like{
  final int likes;
  final List<String> usernames;

  Like({required this.likes, required this.usernames});

  factory Like.fromJson(Map<String, dynamic>json){
    return Like(
    likes: json['likes'],
    usernames:json['usernames'] );
  }
  Map<String, dynamic> toJson(){
    return{
      'likes':this.likes,
      'usernames': this.usernames,
    };
  }
}





class Comments{
  final String username;
  final String imageUrl;
  final String comment;

 Comments({required this.comment,
   required this.imageUrl,
   required this.username
  });

  factory Comments.fromJson(Map<String, dynamic>json){
    return Comments(
        comment: json['comment'],
        imageUrl: json['imageUrl'],
        username: json['username']);
  }
  Map<String, dynamic> toJson(){
    return{
      'comment':this.comment,
      'usernames': this.username,
      'imageURL': this.imageUrl
    };
  }
}
class Post{
  final String title;
  final String description;
  final String id;
  final String imageUrl;
  final String userId;
  final List<Comments> comments;
  final Like like;
  final String imageName;


  Post(
  {
    required this.imageUrl,
    required this.comments,
    required this.id,
    required this.title,
    required this.description,
    required this.like,
    required this.userId,
    required this.imageName
}
      );
}