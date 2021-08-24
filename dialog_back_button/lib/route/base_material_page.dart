import 'package:flutter/material.dart';

import 'index.dart';

class BaseMaterialPage<T> extends MaterialPage<T> {
  final PageTransitionType? transitionType;

  const BaseMaterialPage({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
    this.transitionType,
  }) : super(
            child: child,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            key: key,
            name: name,
            arguments: arguments,
            restorationId: restorationId);

  @override
  Route<T> createRoute(BuildContext context) {
    return PageTransition(
        settings: this,
        child: child,
        type: transitionType ?? PageTransitionType.rightToLeft);
  }
}
