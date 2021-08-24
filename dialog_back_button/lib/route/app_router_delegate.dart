import 'package:dialog_back_button/provider/app_state_manager_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_router_util.dart';
import 'base_material_page.dart';
import 'ui_pages.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];
  BackButtonDispatcher? backButtonDispatcher;

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  AppStateManagerProvider appState;

  AppRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void _removePage(Page? page) {
    if (page != null) {
      _pages.remove(page);
    }
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      appState.notifyListeners();
      return Future.value(true);
    }
    return Future.value(false);
  }

  Page createPage(Widget child, PageConfiguration pageConfig) {
    return BaseMaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      createPage(child, pageConfig),
    );
  }

  void replace(PageConfiguration? newRoute) {
    if (newRoute == null) {
      return;
    }
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    AppRouterUtil.addPage(this, _pages, newRoute);
  }

  void replaceWidet(Widget? child, PageConfiguration? newRoute) {
    if (newRoute == null) {
      return;
    }
    if (child == null) {
      AppRouterUtil.addPage(this, _pages, newRoute);
    } else {
      if (_pages.isNotEmpty) {
        _pages.removeLast();
      }
      addPageData(child, newRoute);
    }
  }

  void setPath(List<Page> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration? newRoute) {
    if (newRoute == null) {
      return;
    }
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    AppRouterUtil.addPage(this, _pages, newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    addPageData(child, newRoute);
  }

  void addAll(List<PageConfiguration>? routes) {
    _pages.clear();
    if (routes != null) {
      routes.forEach((route) {
        AppRouterUtil.addPage(this, _pages, route);
      });
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).path != configuration.path;
    if (shouldAddPage) {
      _pages.clear();
      AppRouterUtil.addPage(this, _pages, configuration);
    }
    return SynchronousFuture(null);
  }

  void _setPageAction(PageAction action) {
    if (action.page?.path == null) {
      return;
    }
    switch (action.page!.path) {
      case onePath:
        OnePageConfig.currentPageAction = action;
        break;
      case twoPath:
        TwoPageConfig.currentPageAction = action;
        break;
      default:
        break;
    }
  }

  List<Page> buildPages() {
    switch (appState.currentAction.state) {
      case PageState.none:
        replaceAll(OnePageConfig);
        break;
      case PageState.addPage:
        _setPageAction(appState.currentAction);
        AppRouterUtil.addPage(this, _pages, appState.currentAction.page);
        break;
      case PageState.pop:
        pop();
        break;
      case PageState.replace:
        _setPageAction(appState.currentAction);
        replace(appState.currentAction.page);
        break;
      case PageState.replaceWidget:
        _setPageAction(appState.currentAction);
        replaceWidet(
            appState.currentAction.widget, appState.currentAction.page);
        break;
      case PageState.replaceAll:
        _setPageAction(appState.currentAction);
        replaceAll(appState.currentAction.page);
        break;
      case PageState.addWidget:
        _setPageAction(appState.currentAction);
        pushWidget(
            appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.addAll:
        addAll(appState.currentAction.pages);
        break;
    }
    appState.resetCurrentAction();
    return List.of(_pages);
  }
}
