import 'package:flutter/material.dart';

class StackRouteBuilder {
  StackRouteBuilder(
      {required this.builder, this.maintainState = true, this.onBeforeEnter});

  final Widget Function(BuildContext context, Map<String, String> args) builder;

  final bool Function(String newRoute)? onBeforeEnter;

  final bool maintainState;
}

extension PathStackRouteExtensions on Widget {
  StackRouteBuilder buildStackRoute(
          {bool maintainState = true,
          bool Function(String newRoute)? onBeforeEnter}) =>
      StackRouteBuilder(
          builder: (_, __) => this,
          onBeforeEnter: onBeforeEnter,
          maintainState: maintainState);
}
