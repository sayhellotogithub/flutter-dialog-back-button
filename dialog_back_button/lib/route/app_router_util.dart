import 'package:dialog_back_button/page/navigator2/one_page.dart';
import 'package:dialog_back_button/page/navigator2/two_page.dart';
import 'package:dialog_back_button/provider/app_state_manager_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app_router_delegate.dart';
import 'index.dart';

class AppRouterUtil {
  static void addPage(AppRouterDelegate appRouterDelegate, List<Page> _pages,
      PageConfiguration? pageConfig) {
    if (pageConfig == null) {
      return;
    }
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).path != pageConfig.path;
    if (shouldAddPage) {
      switch (pageConfig.path) {
        case onePath:
          appRouterDelegate.addPageData(OnePage(), OnePageConfig);
          break;
        case twoPath:
          appRouterDelegate.addPageData(TwoPage(), TwoPageConfig);
          break;
        default:
          break;
      }
    }
  }

  static AppStateManagerProvider getAppState(BuildContext context) {
    return Provider.of<AppStateManagerProvider>(context, listen: false);
  }

  static void popPage(BuildContext context) {
    getAppState(context).currentAction = PageAction(state: PageState.pop);
  }
}
