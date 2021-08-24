import 'package:dialog_back_button/provider/app_state_manager_provider.dart';

import 'index.dart';

const String onePath = '/one';
const String twoPath = '/two';
const String threePath = '/three';
const String fourPath = "/four";

class PageConfiguration {
  final String key;
  final String path;
  PageAction? currentPageAction;
  PageTransitionType? transitionType;

  PageConfiguration(
      {required this.key,
      required this.path,
      this.currentPageAction,
      this.transitionType});
}

PageConfiguration OnePageConfig =
    PageConfiguration(key: onePath, path: onePath, currentPageAction: null);
PageConfiguration TwoPageConfig =
    PageConfiguration(key: twoPath, path: twoPath, currentPageAction: null);
