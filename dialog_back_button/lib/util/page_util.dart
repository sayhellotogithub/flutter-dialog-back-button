import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_util.dart';

const double toolbarHeight = 70;

///
///解决statusbar color https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
///
///
class PageUtil {
  static buildPage(Widget body, Widget titleWidget) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.white));
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        backgroundColor: Colors.white,
        // status bar color
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        title: titleWidget,
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }

  static buildLandScapeFullPage(Widget body, Widget titleWidget) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.black));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        backgroundColor: ColorUtil.color303030,
        // status bar color
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        title: titleWidget,
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
