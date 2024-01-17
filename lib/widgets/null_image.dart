import 'package:flutter/material.dart';

class NullImage extends StatelessWidget {
  const NullImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/US.png',
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
