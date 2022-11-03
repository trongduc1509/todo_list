import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import '../default.dart';
import '../helper/delay_timer.dart';
import 'common_icon.dart';

class CommonField extends StatelessWidget {
  const CommonField(
      {Key? key,
      this.controller,
      this.initialValue,
      this.focusNode,
      this.decoration = const InputDecoration(),
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.autofocus = false,
      this.readOnly = false,
      this.toolbarOptions,
      this.showCursor,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.autocorrect = true,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions = true,
      this.maxLengthEnforcement,
      this.maxLines = 1,
      this.minLines,
      this.expands = false,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth = 2.0,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.enableInteractiveSelection = true,
      this.selectionControls,
      this.buildCounter,
      this.scrollPhysics,
      this.autofillHints,
      this.autovalidateMode,
      this.scrollController,
      this.restorationId,
      this.enableIMEPersonalizedLearning = true,
      this.enaleBorder = true,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      )})
      : super(key: key);

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final bool enaleBorder;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: enaleBorder
              ? Border.all(
                  style: BorderStyle.solid,
                  width: 1,
                  color: DefaultStyle().greyDisable,
                )
              : null,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: padding,
        child: TextFormField(
          controller: controller,
          decoration: decoration,
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style ?? Theme.of(context).textTheme.bodyLarge,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          restorationId: restorationId,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        ),
      );
}

class CommonSearchTxt extends StatelessWidget {
  CommonSearchTxt(
      {Key? key,
      required this.controller,
      required this.onChanged,
      this.onCodeScanned,
      this.onClear,
      this.hintText,
      this.onTapScan,
      this.hiddenScan = false})
      : super(key: key);

  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String)? onCodeScanned;
  final Function()? onClear;
  final Function()? onTapScan;
  final String? hintText;
  final bool hiddenScan;

  final _debouncer = DelayTimer(milliseconds: 650);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor().greyBorder),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 12,
          ),
          Icon(
            Icons.search,
            size: 22,
            color: AppColor().greyBorder,
          ),
          Expanded(
              child: CommonField(
            padding: const EdgeInsets.only(left: 5),
            backgroundColor: Colors.transparent,
            controller: controller,
            enaleBorder: false,
            onTap: () => log('start edit'),
            onChanged: (text) {
              var searchTxt = text.trim();
              _debouncer.run(() {
                onChanged(searchTxt);
              });
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
            maxLines: 1,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: DefaultStyle()
                    .t16RegularWithoutHeight
                    .apply(color: AppColor().greyBorder),
                hintText: hintText ?? 'Nhập mã LCNB'),
          )),
          if (controller.text.trim() != '')
            RoundedIcon(
              icon: Icons.close,
              foreground: Colors.white,
              size: 10,
              background: AppColor().greyBorder,
              onTab: () {
                controller.clear();
                if (onClear != null) {
                  onClear!();
                }
              },
            ),
          const SizedBox(
            width: 8,
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    );
  }
}
