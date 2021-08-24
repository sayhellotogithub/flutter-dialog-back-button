import 'package:dialog_back_button/route/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PageState {
  none,
  addPage,
  addAll,
  addWidget,
  pop,
  replace,
  replaceWidget,
  replaceAll
}

class PageAction {
  PageState state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction({this.state = PageState.none, this.page, this.pages, this.widget});
}

class AppStateManagerProvider extends ChangeNotifier {
  PageAction _currentAction = PageAction();

  PageAction get currentAction => _currentAction;

  set currentAction(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }

  void resetCurrentAction() {
    _currentAction = PageAction();
  }
}
