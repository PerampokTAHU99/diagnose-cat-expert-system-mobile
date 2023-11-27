import 'package:flutter/material.dart';

class Snackbar extends SnackBar {
  final String text;

  Snackbar({Key? key, required this.text}): super(
    key: key,
    content: Text(text),
    duration: const Duration(seconds: 5),
  );
}
