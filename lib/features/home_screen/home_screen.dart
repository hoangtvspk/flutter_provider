import 'package:flutter/material.dart';
import 'package:flutter_provider/app_base/config/app_routes.dart';
import 'package:flutter_provider/common/widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Screen")),
        body: Column(children: [
          Center(
            child: AppButton(
              text: "Change Theme",
              onClicked: () =>
                  Navigator.of(context).pushNamed(AppRoutesMain.setting),
            ),
          )
        ]),
      ),
    );
  }
}
