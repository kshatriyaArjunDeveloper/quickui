import 'package:example/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

import 'container_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello UI'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container_(
              allPadding: 12,
              topLeftRadius: 8,
              bottomRightRadius: 8,
              color: Theme.of(context).colorScheme.inversePrimary,
              child: const Text('Custom container').onClick(() {
                _navigateToContainerScreen(context);
              }),
            ),
            Container_(
              topMargin: 20,
              allPadding: 12,
              topLeftRadius: 8,
              bottomRightRadius: 8,
              color: Theme.of(context).colorScheme.inversePrimary,
              child: const Text('Custom image').onClick(() {
                _navigateToImageScreen(context);
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToContainerScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ContainerScreen(),
      ),
    );
  }

  void _navigateToImageScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImageScreen(),
      ),
    );
  }
}
