import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import '../../../app_base/services/rest_api/rest_api.dart';
import '../models/post_model.dart';

class PostViewModel extends ChangeNotifier {
  Api api = Api();

  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Dio _dio = Dio();

  Future<void> fetchPosts() async {
    try {
      final response = await api.get(ApiEndpoint.getAllPosts);
      if (response!.statusCode == 200) {
        List<dynamic> jsonResponse = response.data;
        _posts = jsonResponse.map((data) => Post.fromJson(data)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }

  Future<void> addPost(String title, String body) async {
    try {
      final response = await api.post(
        ApiEndpoint.getAllPosts,
        data: {
          'title': title,
          'body': body,
          'userId': 1, // Assuming a static user ID for the example
        },
      );
      if (response!.statusCode == 201) {
        dynamic jsonResponse = response.data;
        _posts.insert(0, Post.fromJson(jsonResponse));
        notifyListeners();
      } else {
        throw Exception('Failed to add post');
      }
    } catch (error) {
      throw Exception('Failed to add post: $error');
    }
  }
}
