import 'package:flutter/material.dart';

class AppColor extends ColorScheme {
  factory AppColor() => colorScheme;

  const AppColor._(
      {this.success = Colors.green,
      this.onSuccess = Colors.white,
      this.icon = const Color(0xFF949494),
      this.caption = const Color(0xFFCCCCCC),
      this.text = const Color(0xFF292929),
      this.header = const Color(0xFF292929),
      this.subtitle = const Color(0xFFCCCCCC),
      this.scaffoldBackground = const Color(0xFFEBEBEB),
      this.backgroundHome = const Color(0xFFFAFAFA),
      this.disable = const Color(0xFFC2C2C2),
      this.onDisable = Colors.white,
      this.textField = Colors.white,
      this.blueButton = const Color(0xFF0050B3),
      this.greyBackground = const Color(0xFFDCDCDC),
      this.greyBorder = const Color(0xFFACACAC),
      this.greyTxt = const Color(0xFF505050),
      this.greenBackground = const Color(0xFFE5FDD0),
      this.greenBorder = const Color(0xFF52C41A),
      this.redBackground = const Color(0xFFFFCCC7),
      this.redBorder = const Color(0xFFF5222D),
      this.yellowBackground = const Color(0xFFFFFBE6),
      this.bluegreentxt = const Color(0xFF00A2B8),
      this.bluegreenBackground = const Color(0xFFE1FBFF),
      this.bluegreenBorder = const Color(0xFF00BDD6),
      this.yellowBorder = const Color(0xFFFAAD14),
      this.yellowTxt = const Color(0xFFFA8C16),
      this.greentxt = const Color(0xFF52C41A),
      this.redTxt = const Color(0xFFF5222D),
      this.blueLightBg = const Color(0xFFD8F2FF),
      this.blueLightBorder = const Color(0xFF3E90F7),
      this.blueLightTxt = const Color(0xFF1890FF),
      this.lightGrey = const Color(0xFFE5E5E5),
      this.appColorStart = const Color(0xFF00387C),
      this.appColorEnd = const Color(0xFF0150B3),
      this.notificationUnread = const Color(0xFFE6F7FF),
      this.notificationRead = const Color(0XFFF2F3F4),
      this.blueFilter = const Color(0XFF1890FF),
      this.blackTitle = const Color(0XFF222222),
      this.greySecondary = const Color(0XFF7E7E7E),
      this.backGroundNotify = const Color(0xFFF0F0F0),
      this.dividerColor = const Color(0xFFD8D8D8),
      this.fontBacktitle = const Color(0xFF222222),
      this.greyC3Color = const Color(0xFFC3C3C3),
      this.greenIcon = const Color(0xFF95DE64),
      this.orangeBackground = const Color(0xFFFFA500),
      this.iconGrey = const Color(0xFF000073),
      this.redShadow = const Color(0xFFFFA39E),
      this.greenShadow = const Color(0xFFB7EB8F),
      this.purseBorder = const Color(0xFF8D83FF),
      this.purseBackGround = const Color(0xFFDBD8FF),
      this.greyF4F4 = const Color(0xFFF4F4F4)})
      : super(
          // button
          primary: const Color(0xFF0050B3),
          // text button
          onPrimary: Colors.white,
          // app bar 1
          primaryContainer: const Color(0xFF0050B3),
          // text app bar 1
          onPrimaryContainer: Colors.white,
          // unknown
          primaryVariant: const Color(0xFF0D0D0D),
          // unknown
          inversePrimary: Colors.white,
          // divider
          outline: const Color(0xFFC2D5ED),
          // shadow
          shadow: Colors.black12,
          // brightness
          brightness: Brightness.light,
          // background anh
          tertiary: const Color(0xFF727272),
          // icon anh
          tertiaryContainer: Colors.white,
          // background icon (loai co background)
          onTertiary: const Color(0xFFDEDEDE),
          onTertiaryContainer: Colors.black,
          // app bar 2
          secondary: const Color(0xFFEFEFEF),
          // text app bar 2
          onSecondary: const Color(0xFF333333),
          secondaryContainer: const Color(0xFFF2F2F2),
          onSecondaryContainer: const Color(0xFF333333),
          // unknown
          secondaryVariant: const Color(0xFFF2F2F2),
          // error
          error: const Color(0xFFFFD3D3),
          // text error
          onError: const Color(0xFFFF0000),
          // error tag
          errorContainer: const Color(0xFFFF7875),
          // text on error tag
          onErrorContainer: const Color(0xFFFFFFFF),
          // background
          background: Colors.white,
          // use text color
          onBackground: Colors.black,
          // surface
          surface: Colors.white,
          // use text color
          onSurface: Colors.black,
          // tag
          surfaceVariant: const Color(0xFFDCDCDC),
          // text tag
          onSurfaceVariant: const Color(0xFF333333),
          //  tag 2
          inverseSurface: const Color(0xFFDCDCDC),
          // text tag 2
          onInverseSurface: const Color(0xFF333333),
        );

  final Color success;
  final Color onSuccess;
  final Color text;
  final Color caption;
  final Color header;
  final Color subtitle;
  final Color icon;
  final Color scaffoldBackground;
  final Color backgroundHome;
  final Color disable;
  final Color onDisable;
  final Color textField;
  final Color blueButton;
  final Color greyBackground;
  final Color greyBorder;
  final Color greenBackground;
  final Color greenBorder;
  final Color greentxt;
  final Color redBackground;
  final Color redBorder;
  final Color yellowBackground;
  final Color yellowBorder;
  final Color greyTxt;
  final Color redTxt;
  final Color yellowTxt;
  final Color blueLightBg;
  final Color blueLightBorder;
  final Color blueLightTxt;
  final Color lightGrey;

  final Color appColorStart;
  final Color appColorEnd;

  final Color notificationUnread;

  final Color notificationRead;
  final Color blueFilter;
  final Color blackTitle;
  final Color greySecondary;
  final Color backGroundNotify;
  final Color dividerColor;
  final Color fontBacktitle;
  final Color greyC3Color;
  final Color greenIcon;
  final Color orangeBackground;

  final Color iconGrey;
  final Color redShadow;
  final Color greenShadow;
  final Color greyF4F4;

  final Color purseBorder;
  final Color purseBackGround;

  final Color bluegreenBackground;
  final Color bluegreenBorder;
  final Color bluegreentxt;
}

const colorScheme = AppColor._();
