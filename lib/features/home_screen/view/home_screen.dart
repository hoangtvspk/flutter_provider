import 'package:flutter/material.dart';
import 'package:flutter_provider/common/widgets/app_button.dart';
import 'package:provider/provider.dart';

import '../viewmodel/post_viewmodel.dart';
import 'widgets/mode_toggle_button.dart';

class HomeScreen extends StatelessWidget {
  String? title;
  String? body;
  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: AppButton(
              text: "App Setting",
              onClicked: () => Navigator.pushNamed(context, '/setting'),
            ),
          ),
          Expanded(
            child: Consumer<PostViewModel>(
              builder: (context, model, child) {
                if (model.posts.isEmpty) {
                  model.fetchPosts();
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: model.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model.posts[index].title),
                        subtitle: Text(model.posts[index].body),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Post'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (value) => title = value,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Body'),
                    onChanged: (value) => body = value,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    postViewModel.addPost(title!, body!);
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
