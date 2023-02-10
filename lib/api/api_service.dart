import 'dart:convert';

import 'package:http/http.dart';
import 'package:poc/api/models/Post.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final Client httpClient;

  ApiService({required this.httpClient});

  Future<List<Post>> getPosts() async {
    const url = '$_baseUrl/posts';
    final response = await httpClient.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('error getting posts');
    }

    final posts = jsonDecode(response.body) as List;
    return posts.map((rawPost) => Post.fromJson(rawPost)).toList();
  }
}
