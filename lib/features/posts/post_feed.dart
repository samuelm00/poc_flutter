import 'package:flutter/material.dart';
import 'package:poc/api/api_service.dart';
import 'package:poc/api/models/post.dart';
import 'package:poc/bootstrap.dart';
import 'package:poc/widgets/feed_list.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({super.key});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  List<Post> posts = [];
  final ApiService apiService = getIt.get<ApiService>();

  getAndSetPosts() async {
    List<Post> _posts = await apiService.getPosts();
    setState(() {
      posts = _posts;
    });
  }

  @override
  void initState() {
    super.initState();
    getAndSetPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Post feed',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: FeedList(posts: posts),
        )
      ],
    );
  }
}
