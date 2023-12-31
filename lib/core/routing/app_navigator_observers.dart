import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'logger.dart';

class AppNavigatorObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {

    _currentNameRouteSet = route.settings.name;
    _currentRouteSet = route;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      AppLogger.log('Back from route: ${route.settings.name}');
    }
    super.didPop(route, previousRoute);
    _currentNameRouteSet = previousRoute?.settings.name;
    _currentRouteSet = previousRoute;
  }


  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    AppLogger.log('Tab route re-visited: ${route.name}');
    _currentNameRouteSet = route.name;
  }

  String? _currentRouteName;

  set _currentNameRouteSet(String? routeName) {
    _currentRouteName = routeName;
    AppLogger.log("Current route is: $_currentRouteName", LoggingType.info);
    return;
  }

  String? get currentRouteName => _currentRouteName;

  ///
  Route? _currentRoute;

  set _currentRouteSet(Route? route) {
    _currentRoute = route;
    AppLogger.log("Current route type is: $_currentRoute", LoggingType.info);
    return;
  }

  Route? get currentRoute => _currentRoute;
}
