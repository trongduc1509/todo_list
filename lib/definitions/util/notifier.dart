import 'package:flutter/material.dart';

import '../widgets/check_bottom_sheet.dart';

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
}
