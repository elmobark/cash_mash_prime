import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

import 'path_stack_path_provider.dart';
import 'stack_route_builder.dart';

export 'path_stack_path_provider.dart';
export 'stack_route_builder.dart';

class PathStack extends StatefulWidget {
  static const kDefaultDuration = Duration(milliseconds: 250);

  final String? path;
  final String? basePath;
  final Map<List<String>, StackRouteBuilder> routes;
  final bool caseSensitive;
  final Widget Function(BuildContext context, Widget child)? scaffoldBuilder;
  final Widget Function(
    BuildContext context,
    Widget child,
    AnimationController animation,
    Animation<double> secondaryAnimation,
  )? transitionBuilder;
  final Widget Function(BuildContext context)? unknownPathBuilder;
  final void Function(String path, Map<String, String> args,
      {String matchedRoute})? onRouteChanging;
  final Duration transitionDuration;

  const PathStack(
      {Key? key,
      this.path,
      required this.routes,
      this.basePath,
      this.caseSensitive = false,
      this.scaffoldBuilder,
      this.transitionBuilder,
      this.transitionDuration = kDefaultDuration,
      this.unknownPathBuilder,
      this.onRouteChanging})
      : super(key: key);

  static PathStackState? of(BuildContext context) {
    final _InheritedPathStack? stack =
        context.dependOnInheritedWidgetOfExactType<_InheritedPathStack>();
    return stack?.state;
  }

  @override
  PathStackState createState() => PathStackState();
}

class PathStackState extends State<PathStack> with TickerProviderStateMixin {
  final Map<String, Widget> _knownRoutes = {};
  String? _matchedRoutePath;
  late AnimationController transitionInAnim =
      AnimationController(vsync: this, duration: widget.transitionDuration)
        ..forward();

  late AnimationController transitionOutAnim =
      AnimationController(vsync: this, duration: widget.transitionDuration)
        ..reverse();
  Map<String, String> _args = {};
  Map<String, String> get args => _args;

  String get basePath =>
      widget.basePath ?? PathStack.of(context)?.currentRoutingPath ?? '';

  String get path =>
      widget.path ??
      PathStack.of(context)?.path ??
      PathStackPathProvider.of(context)?.path ??
      '';

  String get currentRoutingPath =>
      (PathStack.of(context)?.currentRoutingPath ?? '') +
      (_matchedRoutePath?.split(',')[0] ?? '');

  @override
  Widget build(BuildContext context) {
    final _RoutePathWithBuilder routeToShow = getRouteBuilderForPath(path);

    final bool allowChange =
        routeToShow.content.onBeforeEnter?.call(routeToShow.path) ?? true;
    debugPrint('currentRoutingPath: $currentRoutingPath');

    if (allowChange) {
      _args = getArgsFromPath(route: basePath + routeToShow.path, path: path);

      if (_matchedRoutePath != routeToShow.path) {
        widget.onRouteChanging
            ?.call(path, args, matchedRoute: routeToShow.path);

        PathStackRouteChangingNotification(path, args,
                matchedRoute: routeToShow.path)
            .dispatch(context);

        transitionInAnim.forward(from: 0);
        transitionOutAnim.reverse(from: 0);
        _matchedRoutePath = routeToShow.path;
      }

      _knownRoutes[routeToShow.path] = routeToShow.build(context, args);
    }

    final List<Widget> children = _knownRoutes.values.toList();

    final int index =
        _knownRoutes.keys.toList().indexWhere((r) => r == _matchedRoutePath);
    Widget content = IndexedStack(index: index, children: children);
    if (routeToShow.content.maintainState == false) {
      removeRouteNextFrame(routeToShow);
    }

    content = widget.transitionBuilder
            ?.call(context, content, transitionInAnim, transitionOutAnim) ??
        content;
    content = widget.scaffoldBuilder?.call(context, content) ?? content;

    return _InheritedPathStack(state: this, child: content);
  }

  void clearState() => _knownRoutes.clear();

  @override
  void dispose() {
    clearState();
    super.dispose();
  }

  bool checkPathMatchesRoute(String path, List<String> routes) {
    final bool allowSuffix = routes[0].endsWith('/') && routes[0] != '/';
 
    for (var i = 0; i < routes.length; i++) {
      final regExp = pathToRegExp('$basePath${routes[i]}',
          prefix: allowSuffix, caseSensitive: widget.caseSensitive);

      if (regExp.hasMatch(path)) {
 
        return true;
      }
    }
    return false;
  }

  _RoutePathWithBuilder getRouteBuilderForPath(String path) {
    _RoutePathWithBuilder? matchingRoute;

    widget.routes.forEach((key, value) {
      if (checkPathMatchesRoute(path, key) && matchingRoute == null) {
        matchingRoute = _RoutePathWithBuilder(key.join(','), value);
      }
    });

    if (matchingRoute == null) {
      debugPrint('WARNING: Unable to find a route for $path');
      matchingRoute =
          _RoutePathWithBuilder('404', StackRouteBuilder(builder: (c, _) {
        return widget.unknownPathBuilder?.call(c) ??
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Page Not Found :(',
                        style: TextStyle(fontSize: 26)),
                    Text("Unable to match a route to: '$path'"),
                  ],
                ),
              ),
            );
      }));
    } else {}
    return matchingRoute!;
  }

  Map<String, String> getArgsFromPath(
      {required String route, required String path}) {
    final List<String> paramList = [];
    final regExp = pathToRegExp(route, parameters: paramList);
    Map<String, String> pathMap = {};
    if (regExp.hasMatch(path)) {
      final match = regExp.matchAsPrefix(path)!;
      pathMap = extract(paramList, match);
    }

    final Map<String, String> queryMap = Uri.parse(path).queryParameters;

    final o = {...pathMap, ...queryMap};
    return o;
  }

  void removeRouteNextFrame(_RoutePathWithBuilder routeToShow) =>
      scheduleMicrotask(() => _knownRoutes.remove(routeToShow.path));
}

class _RoutePathWithBuilder {
  _RoutePathWithBuilder(this.path, this.content);
  final String path;
  final StackRouteBuilder content;

  Widget build(BuildContext context, Map<String, String> args) {
    return _KeyedWidget(
      key: ValueKey(path),
      child: content.builder.call(context, args),
    );
  }
}

class _KeyedWidget extends StatelessWidget {
  const _KeyedWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) => child;
}

class _InheritedPathStack extends InheritedWidget {
  const _InheritedPathStack(
      {Key? key, required Widget child, required this.state})
      : super(key: key, child: child);
  final PathStackState state;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class PathStackRouteChangingNotification extends Notification {
  PathStackRouteChangingNotification(this.path, this.args, {this.matchedRoute});
  final String path;
  final String? matchedRoute;
  final Map<String, String> args;
}
