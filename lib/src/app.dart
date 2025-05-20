import 'package:flutter/material.dart';
import 'package:input_validation/src/features/input_validator/presentation/input_validation_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: InputValidationWidget());
  }
}
