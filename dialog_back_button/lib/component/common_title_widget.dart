import 'package:dialog_back_button/route/index.dart';
import 'package:flutter/material.dart';

import 'title_util.dart';

/**
 * back ,title,right
 */
class CommonTitleWidget extends StatefulWidget {
  final String? title;
  final Widget? rightWidget;
  final VoidCallback? leftClick;

  const CommonTitleWidget(
      {Key? key, this.title, this.rightWidget, this.leftClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommonTitleWidgetState();
  }
}

class _CommonTitleWidgetState extends State<CommonTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleUitl.getLeftBackWidget(() {
            widget.leftClick?.call();
          }),
          SizedBox(
            width: 10,
          ),
          if (widget.title != null)
            Expanded(child: TitleUitl.getTitleWidget(widget.title!)),
          if (widget.rightWidget != null) widget.rightWidget!
        ],
      ),
    );
  }
}
