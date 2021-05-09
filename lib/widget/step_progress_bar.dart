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

  List<Widget> _stepView() {
    var list = <Widget>[];
    contents.asMap().forEach((i, content) {
      list.add(
        Container(
          width: 45.0,
          height: 45.0,
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          child: Text(
            (i + 1).toString(),
            style: TextStyle(fontSize: 18),
          ),
          decoration: BoxDecoration(
            color: content.isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      );

      //line between icons
      if (i != contents.length - 1) {
        list.add(
          Expanded(
            child: Container(
              height: 3.0,
              color: Colors.black,
            ),
          ),
        );
      }
    });

    return list;
  }

  Widget build(BuildContext context) {
    return Row(
      children: _stepView(),
    );
  }
}
