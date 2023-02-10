import 'package:poc/api/models/base.dart';

class Post extends BaseFeedModel {
  final int id;
  final int userId;

  Post({
    required this.id,
    required this.userId,
    required String title,
    required String body,
  }) : super(title: title, body: body);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          title == other.title &&
          body == other.body;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
