import 'package:flutter/material.dart';
import 'package:poc/api/models/post.dart';
import 'package:poc/config/layout/rounded_corners.dart';

class PostFeedItem extends StatelessWidget {
  const PostFeedItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedCorners().shape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            post.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              post.body,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
