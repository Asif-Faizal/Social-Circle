import 'package:flutter/material.dart';

void showNetworkSnackBar(BuildContext context, String message, VoidCallback onPressed) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.wifi_off, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: Colors.orange,
      action: SnackBarAction(
        label: 'Retry',
        textColor: Colors.white,
        onPressed: onPressed,
      ),
    ),
  );
}