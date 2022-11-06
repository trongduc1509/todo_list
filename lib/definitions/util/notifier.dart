import 'package:flutter/material.dart';

import '../colors.dart';
import '../default.dart';
import '../widgets/check_bottom_sheet.dart';
import '../widgets/common_icon.dart';

Notifier _notifier = Notifier._();

class Notifier extends RouteAware {
  Notifier._();

  factory Notifier() => _notifier;

  @override
  void didPush() {}

  static void showCheckBottomSheet(BuildContext context,
      {required List<String> listData,
      bool dismissible = true,
      bool enableDrag = true,
      String? title,
      int? selectedIndex,
      bool enableSearch = false,
      double ratioHeight = 0.5,
      Function(int)? onSelected}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: dismissible,
        enableDrag: enableDrag,
        builder: (context) => CheckBottomSheet(
              onSelected: onSelected,
              ratioHeight: ratioHeight,
              enableSearch: enableSearch,
              listData: listData,
              title: title,
              selectedIndex: selectedIndex,
            ));
  }

  static void showToast(BuildContext context,
      {required bool isError,
      required String title,
      required String desctipion,
      double? bottomMargin}) {
    final snackBar = SnackBar(
      content: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedIcon(
              onTab: () {},
              icon: isError ? Icons.close : Icons.check,
              size: 14,
              background: isError ? Colors.red : AppColor().greentxt,
              foreground: Colors.white,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: DefaultStyle().t14Bold.apply(color: Colors.white),
                    ),
                  if (desctipion.isNotEmpty)
                    Text(desctipion,
                        style: DefaultStyle()
                            .t14Regular
                            .apply(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(milliseconds: 2500),
      margin: const EdgeInsets.only(left: 16, right: 16),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
