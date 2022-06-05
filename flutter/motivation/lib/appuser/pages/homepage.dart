import 'package:flutter/material.dart';

class AppUserHomepage extends StatelessWidget {
  const AppUserHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("User Home"),
      ),
    );
  }
}
