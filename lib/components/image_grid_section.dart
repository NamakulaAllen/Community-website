import 'package:flutter/material.dart';

class ImageGridSection extends StatelessWidget {
  const ImageGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularImage(imagePath: 'assets/images/PIC1.jpg'),
          CircularImage(imagePath: 'assets/images/PIC1.jpg'),
          CircularImage(imagePath: 'assets/images/PIC1.jpg'),
        ],
      ),
    );
  }
}

class CircularImage extends StatelessWidget {
  final String imagePath;

  const CircularImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
