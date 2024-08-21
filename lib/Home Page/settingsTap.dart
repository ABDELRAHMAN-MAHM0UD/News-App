import 'package:flutter/material.dart';

class Settingstap extends StatelessWidget {
  const Settingstap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Settings Tap",
            style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
