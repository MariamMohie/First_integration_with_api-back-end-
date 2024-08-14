class HomeModel {
  bool status;
  List<Post> posts;

  HomeModel({required this.status, required this.posts});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      posts: List<Post>.from(json['posts'].map((post) => Post.fromJson(post))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'posts': List<dynamic>.from(posts.map((post) => post.toJson())),
    };
  }
}

class Post {
  int id;
  String title;
  String content;
  int userId;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? tag;
  String? deletedAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.tag,
    this.deletedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'],
      tag: json['tag'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image': image,
      'tag': tag,
      'deleted_at': deletedAt,
    };
  }
}

