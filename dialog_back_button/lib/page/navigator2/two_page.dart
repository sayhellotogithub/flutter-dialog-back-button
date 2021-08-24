import 'package:dialog_back_button/component/common_title_widget.dart';
import 'package:dialog_back_button/route/app_router_util.dart';
import 'package:dialog_back_button/util/page_util.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TwoPageState();
  }
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: PageUtil.buildPage(
            _buildBody(),
            CommonTitleWidget(
              title: "Navigator 2.0 Two Page",
              leftClick: () {
                AppRouterUtil.popPage(context);
              },
            )),
        onWillPop: _showDialog);
  }

  Widget _buildBody() {
    return Center(
      child: Text("This is two"),
    );
  }

  Future<bool> _showDialog() async {
    var result = await showDialog<bool>(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('some tip'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("YES"),
          ),
        ],
      ),
    );
    if (result == true) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<bool> _onBackPressed() async {
    var result = await showDialog<bool>(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('some tip'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("YES"),
          ),
        ],
      ),
    );
    if (result == true) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
