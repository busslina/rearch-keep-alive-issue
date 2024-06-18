import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';
import 'package:rearch_keep_alive_issue/core/screens/screen_1.dart';
import 'package:rearch_keep_alive_issue/core/screens/screen_2.dart';

void main() {
  runApp(const RearchBootstrapper(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyNavigator(),
      ),
    );
  }
}

class MyNavigator extends RearchConsumer {
  const MyNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final screenId = use.data(1);

    return switch (screenId.value) {
      1 => ScreenOne(
          screenIndexController: screenId,
        ),
      2 => const ScreenTwo(),
      _ => throw ('Bad screen index: ${screenId.value}'),
    };
  }
}
