import 'package:dialog_back_button/component/common_title_widget.dart';
import 'package:dialog_back_button/page/navigator1/two_page.dart';
import 'package:dialog_back_button/util/page_util.dart';
import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnePageState();
  }
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return PageUtil.buildPage(
        _buildBody(),
        CommonTitleWidget(
          title: "Navigator1.0 One Page",
          leftClick: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _buildBody() {
    return Center(
      child: InkWell(
        child: Text("goto two page"),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return TwoPage();
          }));
        },
      ),
    );
  }
}
