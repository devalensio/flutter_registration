import 'package:flutter/material.dart';

class Content {
  final String title;
  final bool isActive;
  final Widget child;

  const Content({
    @required this.title,
    @required this.isActive,
    @required this.child,
  });
}
