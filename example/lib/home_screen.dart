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
        child: Container_(
          allPadding: 12,
          topLeftRadius: 8,
          bottomRightRadius: 8,
          color: Theme.of(context).colorScheme.inversePrimary,
          child: const Text('Custom container').onClick(() {
            _navigateToContainerScreen(context);
          }),
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
}
