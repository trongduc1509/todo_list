import 'package:flutter/material.dart';

class DefaultStyle {
  DefaultStyle();

  /// Todo: Color
  Color get backgroundColor => const Color(0xFFFFFFFF);

  final Color swatch = Colors.blue;
  final Color primary = const Color(0xFF0050B3);

  final Color red = const Color(0xFFF5222D);
  final Color blue = const Color(0xFF3E90F7);
  final Color greySecondary = const Color(0XFF7E7E7E);
  final Color blackTitle = const Color(0XFF222222);
  final Color greyDisable = const Color(0xffACACAC);

  /// Todo: text style
  TextStyle get t10Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 10,
      fontStyle: FontStyle.normal);

  TextStyle get t10Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      fontStyle: FontStyle.normal);

  TextStyle get t10Bold => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w700,
      fontSize: 10,
      fontStyle: FontStyle.normal);

  TextStyle get t12Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t12Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t12Bold => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t13Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 13.5,
      fontStyle: FontStyle.normal);

  TextStyle get t13Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 13.5,
      fontStyle: FontStyle.normal);

  TextStyle get t13Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 13.5,
      fontStyle: FontStyle.normal);

  TextStyle get t14Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontStyle: FontStyle.normal);

  TextStyle get t14Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      height: 1.32);

  TextStyle get t14Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      height: 1.32);

  TextStyle get t14MediumV2 => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontStyle: FontStyle.normal);

  TextStyle get t14BoldWhite => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      height: 1.32);

  TextStyle get t16Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.26);

  TextStyle get t16Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.4);

  TextStyle get t16Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal,
      height: 1.26);

  TextStyle get t16RegularWithoutHeight => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontStyle: FontStyle.normal);

  TextStyle get t20Bold => const TextStyle(
      fontFamily: 'SF Pro Text Bold',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      fontStyle: FontStyle.normal);

  TextStyle get t20Medium => const TextStyle(
      fontFamily: 'SF Pro Text Medium',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      fontStyle: FontStyle.normal);

  TextStyle get t20Regular => const TextStyle(
      fontFamily: 'SF Pro Text Regular',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      fontStyle: FontStyle.normal);

  TextStyle get textInputStyle => t16Medium;

  TextStyle get linkedText => t14Bold.copyWith(color: blue);

  TextStyle get bodyText => t14Regular.copyWith(color: Colors.black);

  /// Todo dimension
  double get elementPadding => 4.0;

  double get screenPadding => 16;

  EdgeInsets get screenInsets => EdgeInsets.all(screenPadding);

  final app3size = 56.0;

  final iconSize = 24.0;

  final progressThickness = 2.0;

  /// Todo: TextField
  BoxDecoration get _inputBorder => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC2D5ED)),
        borderRadius: BorderRadius.circular(6.0),
      );

  BoxDecoration get _inputErrorBorder => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: red),
        borderRadius: BorderRadius.circular(6.0),
      );

  BoxDecoration get _inputFocusBorder => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primary),
        borderRadius: BorderRadius.circular(6.0),
      );

  InputDecoration inputDecoration(String label, [String? error]) =>
      InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          label: Text(label, style: t12Medium),
          labelStyle: t16Medium,
          floatingLabelStyle: t12Medium,
          errorText: error,
          filled: false,
          isDense: true,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          border: InputBorder.none);

  BoxDecoration inputBoxDecoration({bool focus = false, bool error = false}) {
    if (error) {
      return _inputErrorBorder;
    } else if (focus) {
      return _inputFocusBorder;
    }
    return _inputBorder;
  }

  // Todo: button
  ButtonStyle get progressButton => ElevatedButton.styleFrom(
      textStyle: t16Bold,
      primary: primary,
      onPrimary: Colors.white,
      onSurface: primary,
      minimumSize: const Size.fromHeight(46));

//Text

}
