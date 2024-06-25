import 'package:dio/dio.dart';
import 'package:api_demo/models/post.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<Post> posts = (response.data as List).map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
