import 'package:flutter/material.dart';
import 'package:poc/api/api_service.dart';
import 'package:poc/api/models/post.dart';
import 'package:poc/bootstrap.dart';
import 'package:poc/features/posts/post_feed_item.dart';
import 'package:poc/widgets/feed_list.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({super.key});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  List<Post> posts = [];
  final ApiService _apiService = getIt.get<ApiService>();

  getAndSetPosts() async {
    List<Post> _posts = await _apiService.getPosts();

    // in the case where the widget is disposed before the async call is done
    // we don't want to call setState
    if (mounted) {
      setState(() {
        posts = _posts;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAndSetPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FeedList<Post>(
        feedItems: posts,
        listItemBuilder: (context, post) => PostFeedItem(
          post: post,
        ),
      ),
    );
  }
}
