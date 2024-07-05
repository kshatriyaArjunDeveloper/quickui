import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container_ Widget Use'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding_(
        allPadding: 16,
        child: ListView(
          children: [
            _buildPaddingMarginExampleContainer(),
            _buildGap(),
            _buildStylingExampleContainer(),
            _buildGap(),
            _buildRoundedExampleContainer(),
            _buildGap(),
            _buildBorderExampleContainer(),
            _buildGap(),
            _buildImageExampleContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPaddingMarginExampleContainer() {
    return Container_(
      topPadding: 10,
      allPadding: 40,
      color: Colors.blueAccent,
      child: const Text(
        'Padding, Margin container',
      ),
    );
  }

  Widget _buildStylingExampleContainer() {
    return Container_(
      gradient: const LinearGradient(
        colors: [
          Colors.blueAccent,
          Colors.redAccent,
        ],
      ),
      boxShadowList: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      shouldMakeCircle: true,
      width: 200,
      child: const Center(
        child: Text(
          'Styling container',
        ),
      ),
    );
  }

  Widget _buildRoundedExampleContainer() {
    return Container_(
      topLeftRadius: 5, // topRightRadius, bottomLeftRadius, bottomRightRadius
      allCornerRadius: 20,
      color: Colors.blueAccent,
      child: const Text(
        'Corners container',
      ),
    );
  }

  Widget _buildBorderExampleContainer() {
    return Container_(
      borderGradient: const LinearGradient(
        colors: [
          Colors.blueAccent,
          Colors.redAccent,
        ],
      ),
      // borderColor: Colors.blue,
      shouldMakeBorderOutside: true,
      borderWidth: 1,
      child: const Text(
        'Border container',
      ),
    );
  }

  Widget _buildImageExampleContainer() {
    return Container_(
      backgroundImageAssetName: 'asset/img_bg_auth_universal.png',
      backgroundImageAlignment: Alignment.topCenter,
      backgroundImageFit: BoxFit.cover,
      verticalPadding: 20,
      child: const Text(
        'Image container',
      ),
    );
  }

  Widget _buildGap() {
    return const SizedBox(
      height: 20,
    );
  }
}
