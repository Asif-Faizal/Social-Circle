import 'package:flutter/material.dart';

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
      backgroundColor: Colors.green,
    ),
  );
}