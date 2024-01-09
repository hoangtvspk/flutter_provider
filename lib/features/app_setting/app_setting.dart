import 'package:flutter/material.dart';
import '../home_screen/view/widgets/mode_toggle_button.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
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
