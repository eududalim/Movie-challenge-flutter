import 'package:flutter/material.dart';
import 'package:movie_challenge_flutter/app/layers/presenters/view/common/error_widget_custom.dart';

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
            child: ErrorWidgetCustom(errorMessage: '404: Page Not Found')));
  }
}
