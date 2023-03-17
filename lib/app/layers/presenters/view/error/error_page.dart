import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});
  static const route = '/error';

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Icon(
          Icons.error,
          size: 60,
        ),
      ),
    ));
  }
}
