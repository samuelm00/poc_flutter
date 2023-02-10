import 'package:flutter/material.dart';
import 'package:poc/api/models/base.dart';

typedef FeedListItemBuilder<T extends BaseFeedModel> = Widget Function(
    BuildContext, T);

class FeedList<T extends BaseFeedModel> extends StatelessWidget {
  FeedList(
      {super.key,
      FeedListItemBuilder<T>? listItemBuilder,
      required this.posts});

  FeedListItemBuilder<T>? listItemBuilder;
  final List<T> posts;

  Widget _constructListItem(BuildContext context, T post) {
    if (listItemBuilder == null) {
      return ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
      );
    }
    return this.listItemBuilder!(context, post);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          this._constructListItem(context, posts[index]),
      itemCount: posts.length,
    );
  }
}
