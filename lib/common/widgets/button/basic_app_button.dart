import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  double? height;
  BasicAppButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(title),
    );
  }
}