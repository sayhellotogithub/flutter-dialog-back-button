import 'package:dialog_back_button/component/common_title_widget.dart';
import 'package:dialog_back_button/page/navigator2/three_page.dart';
import 'package:dialog_back_button/provider/app_state_manager_provider.dart';
import 'package:dialog_back_button/route/app_router_util.dart';
import 'package:dialog_back_button/route/index.dart';
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
          title: "Navigator 2.0 One Page",
        ));
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Text(
              "goto two page",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              AppRouterUtil.getAppState(context).currentAction =
                  PageAction(state: PageState.addPage, page: TwoPageConfig);
            },
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Text(
              "WillPopScope 失效",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              AppRouterUtil.getAppState(context).currentAction = PageAction(
                  state: PageState.addWidget,
                  widget: ThreePage(),
                  page: PageConfiguration(key: threePath, path: threePath));
            },
          ),
        ],
      ),
    );
  }
}
