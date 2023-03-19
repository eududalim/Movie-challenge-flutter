import 'package:flutter/material.dart';

class ErrorWidgetCustom extends StatelessWidget {
  const ErrorWidgetCustom({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          const Icon(
            Icons.error_outline,
            size: 35,
          ),
        ],
      ),
    ));
  }
}
