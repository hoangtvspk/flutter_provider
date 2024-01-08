import 'package:flutter/material.dart';

import 'widgets/mode_toggle_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dynamic Theming Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Toggle button to switch the app theme',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          ModeToggleButton(),
        ],
      ),
    );
  }
}
