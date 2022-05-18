import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';
import 'card1.dart';

void main() {
  // 1
  runApp(const Motivation());
}

class Motivation extends StatelessWidget {
  // 2
  const Motivation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: Create theme
    final theme = FooderlichTheme.light();
    // TODO: Apply Home widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Motivational Video',
      home: const Home(),
    );
    // 3
    // return MaterialApp(
    //   // TODO: Add theme
    //   theme: theme,
    //   title: 'Motivational Quote',
    //   // 4
    //   home: Scaffold(
    //     // TODO: Style the title
    //     appBar: AppBar(
    //       title: Text(
    //         'Motivational Quotes',
    //         style: theme.textTheme.headline6,
    //       ),
    //     ),
    //     // TODO: Style the body text
    //     body: Center(
    //       child:
    //           Text('Let\'s get cooking ! ', style: theme.textTheme.headline1),
    //     ),
    //   ),
    // );
  }
}
