import 'package:flutter/material.dart';

class PathStackPathProvider extends InheritedWidget {
  const PathStackPathProvider(
      {Key? key, required Widget child, required this.path})
      : super(key: key, child: child);
  final String path;

  Widget build(BuildContext context) => child;
  static PathStackPathProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PathStackPathProvider>();

  @override
  bool updateShouldNotify(covariant PathStackPathProvider oldWidget) =>
      oldWidget.path != path;
}
