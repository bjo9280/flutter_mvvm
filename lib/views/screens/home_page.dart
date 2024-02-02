import 'package:flutter/material.dart';
import '../../view_models/post_view_model.dart';
import '../widgets/post_list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostViewModel _viewModel = PostViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM Demo")),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          return ListView.builder(
            itemCount: _viewModel.posts.length,
            itemBuilder: (context, index) {
              return PostListTile(post: _viewModel.posts[index]);
            },
          );
        },
      ),
    );
  }
}
