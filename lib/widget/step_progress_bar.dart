import 'package:flutter/material.dart';

import '../models/content.dart';

class StepProgressBar extends StatelessWidget {
  final double width;
  final List<Content> contents;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;

  StepProgressBar({
    @required this.width,
    @required this.contents,
    @required this.currentStep,
    @required this.activeColor,
    @required this.inactiveColor,
  });

  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
