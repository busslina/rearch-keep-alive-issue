import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class ScreenOne extends RearchConsumer {
  const ScreenOne({
    super.key,
    required this.screenIndexController,
  });

  final ValueWrapper<int> screenIndexController;

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList.list(
            addAutomaticKeepAlives: true,
            children: List.generate(
                50,
                (index) => _MyCustomWidget(
                      index: index,
                      screenIndexController: screenIndexController,
                    )))
      ],
    );
  }
}

class _MyCustomWidget extends RearchConsumer {
  const _MyCustomWidget({
    required this.index,
    required this.screenIndexController,
  });

  final int index;
  final ValueWrapper<int> screenIndexController;

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    use.automaticKeepAlive();

    use.effect(
      () {
        print('_MyCustomWidget -- $index -- init');
        return () => print('_MyCustomWidget -- $index -- dispose');
      },
      [],
    );

    return Container(
      width: 600,
      height: 400,
      color: Colors.lime,
      child: Center(
        child: Column(
          children: [
            Text('Widget $index'),
            ElevatedButton(
                onPressed: () => screenIndexController.value = 2,
                child: const Text('Move to Screen 2'))
          ],
        ),
      ),
    );
  }
}
