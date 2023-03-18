import 'package:flutter/material.dart';

LinearProgressIndicator customProgressIndicator([double height = 50]) =>
    LinearProgressIndicator(
      minHeight: height,
      color: const Color.fromARGB(14, 255, 255, 255),
      backgroundColor: const Color.fromARGB(10, 255, 255, 255),
    );
