import 'package:flutter/cupertino.dart';
import '../models/post.dart';
import '../services/http_service.dart';

class PostViewModel extends ChangeNotifier {
  final HttpService _httpService = HttpService();
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    _posts = await _httpService.getPosts();
    notifyListeners();
  }
}
