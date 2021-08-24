import 'package:dialog_back_button/util/color_util.dart';
import 'package:dialog_back_button/util/image_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleUitl {
  static const double TITLE_HEIGHT = 70;
  static const Color BACK_GROUND_WHITE = Colors.white;

  static Widget getLeftBackWidget(Function backClick) {
    return InkWell(
      child: SvgPicture.asset(
        ImageUtil.getIconString("icon_back_arrow_black"),
        height: 24,
        width: 24,
      ),
      onTap: () {
        backClick();
      },
    );
  }

  static Widget getTitleWidget(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18,
          color: ColorUtil.color303030,
          fontWeight: FontWeight.bold),
    );
  }

  static Widget rightWidget(String rightTitle, Function? rightClick) {
    return InkWell(
      onTap: () {
        rightClick?.call();
      },
      child: Text(
        rightTitle,
        style: TextStyle(color: Color(0xFF445FF1), fontSize: 14),
      ),
    );
  }



}
