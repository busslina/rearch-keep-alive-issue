import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';

class ScreenTwo extends RearchConsumer {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    return const Center(
      child: Text('Screen 2'),
    );
  }
}
