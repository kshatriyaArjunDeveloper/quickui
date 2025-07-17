import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image_ Widget Use'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding_(
        allPadding: 16,
        child: ListView(
          children: [
            _buildHeadlineText('Asset Image'),
            _buildAssetImage(),
            _buildGap(),
            _buildHeadlineText('SVG Image'),
            _buildSvgImage(),
            _buildGap(),
            _buildHeadlineText('GIF Image'),
            _buildGif(),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetImage() {
    return const Center(
      child: Image_(
        assetName: 'asset/img_bg_auth_universal.png',
        height: 200,
        width: 200,
        boxFit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildSvgImage() {
    return const Image_(
      localSvgAsset: 'asset/ic_long_right_arrow.svg',
      height: 100,
      width: 100,
      svgColor: Colors.green,
    );
  }

  Widget _buildGif() {
    return const Center(
      child: Image_(
        assetName: 'asset/gif_name.gif',
        height: 40,
        boxFit: BoxFit.cover,
        alignment: Alignment.topRight,
      ),
    );
  }

  Widget _buildHeadlineText(
    String text,
  ) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildGap() {
    return const SizedBox(
      height: 20,
    );
  }
}
