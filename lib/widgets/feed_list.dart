import 'package:flutter/material.dart';
import 'package:poc/api/models/base.dart';

typedef FeedListItemBuilder<T extends BaseFeedModel> = Widget Function(
    BuildContext, T);

class FeedList<T extends BaseFeedModel> extends StatelessWidget {
  const FeedList({super.key, this.listItemBuilder, required this.feedItems});

  final FeedListItemBuilder<T>? listItemBuilder;
  final List<T> feedItems;

  Widget _constructListItem(BuildContext context, T post) {
    return this.listItemBuilder?.call(context, post) ??
        ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          this._constructListItem(context, feedItems[index]),
      itemCount: feedItems.length,
    );
  }
}
