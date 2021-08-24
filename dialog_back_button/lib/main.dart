import 'package:dialog_back_button/page/navigator1/one_page.dart';
import 'package:dialog_back_button/route/app_back_button_dispatcher.dart';
import 'package:dialog_back_button/route/app_route_info_parser.dart';
import 'package:dialog_back_button/route/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/app_state_manager_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppNavigator2();
  }
}

class _MyAppNavigator1 extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
      home: OnePage(),
    );
  }
}

class _MyAppNavigator2 extends State<MyApp> {
  AppStateManagerProvider appStateManagerProvider = AppStateManagerProvider();
  AppRouteInfoParser appRouteInfoParser = AppRouteInfoParser();
  late AppRouterDelegate appRouterDelegate;
  late AppBackButtonDispatcher backButtonDispatcher;

  @override
  void initState() {
    appRouterDelegate = AppRouterDelegate(appStateManagerProvider);
    backButtonDispatcher = AppBackButtonDispatcher(appRouterDelegate);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => appStateManagerProvider)
        ],
        child: MaterialApp.router(
          backButtonDispatcher: RootBackButtonDispatcher(),
          theme:
              ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
          routeInformationParser: appRouteInfoParser,
          routerDelegate: appRouterDelegate,
        ));
  }
}
