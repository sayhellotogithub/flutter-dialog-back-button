import 'package:flutter/material.dart';
import 'ui_pages.dart';

class AppRouteInfoParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");
    if (uri.pathSegments.isEmpty) {
      return OnePageConfig;
    }
    final path = '/' + uri.pathSegments[0];
    switch (path) {
      case twoPath:
        return TwoPageConfig;
      case onePath:
        return OnePageConfig;
      default:
        return OnePageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.path) {
      case twoPath:
        return const RouteInformation(location: twoPath);
      case onePath:
        return const RouteInformation(location: onePath);
      default:
        return const RouteInformation(location: onePath);
    }
  }
}
