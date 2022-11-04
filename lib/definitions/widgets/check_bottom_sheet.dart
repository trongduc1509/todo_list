import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/definitions/extension/string.dart';

import '../colors.dart';
import '../default.dart';
import 'common_txt.dart';

class CheckBottomSheet extends StatefulWidget {
  const CheckBottomSheet(
      {Key? key,
      this.onSelected,
      this.title,
      this.listData = const [],
      this.selectedIndex,
      this.placeHolder,
      this.enableSearch = false,
      this.ratioHeight = 0.5})
      : super(key: key);

  final Function(int)? onSelected;
  final String? title;
  final String? placeHolder;
  final int? selectedIndex;
  final bool enableSearch;
  final List<String> listData;
  final double ratioHeight;

  @override
  State<StatefulWidget> createState() => _CheckBottomSheet();
}

class _CheckBottomSheet extends State<CheckBottomSheet> {
  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
        height: widget.ratioHeight * MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            semanticLabel: "close",
                            size: 24,
                            color: Colors.grey,
                          ))),
                  Center(
                      child: Text(widget.title ?? '',
                          style: DefaultStyle().t16Bold))
                ],
              ),
            ),
            const Divider(),
            if (widget.enableSearch)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                child: CommonField(
                  controller: txt,
                  onTap: () {
                    log("start edit");
                  },
                  onChanged: (text) {
                    String parsed =
                        text.trim().withoutDiacriticalMarks.toLowerCase();
                    if (parsed.isNotEmpty) {
                      var filter = widget.listData
                          .where((element) => ((element.withoutDiacriticalMarks
                                  .toLowerCase()
                                  .contains(parsed)) ||
                              (element.withoutDiacriticalMarks
                                  .toLowerCase()
                                  .contains(parsed))))
                          .toList();
                      // setState(() {
                      //   displayList = filter;
                      // });
                    } else {
                      // displayList = UserInfoHelper().shops;
                    }
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      labelStyle: DefaultStyle()
                          .t16Regular
                          .apply(color: DefaultStyle().greyDisable),
                      hintText: widget.placeHolder,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.search,
                          semanticLabel: "search",
                          size: 18,
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0)),
                  style: DefaultStyle()
                      .t16Regular
                      .apply(color: DefaultStyle().greyDisable),
                ),
              ),
            if (widget.enableSearch)
              const SizedBox(
                height: 8,
              ),
            Expanded(
                flex: 8,
                child: ListView.separated(
                  itemCount: widget.listData.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.onSelected != null) {
                          widget.onSelected!(index);
                        }
                        Navigator.of(context).pop();
                      });
                    },
                    child: ListTile(
                      title: Text(
                        widget.listData[index],
                        style: DefaultStyle().t14Medium.apply(
                            color: widget.selectedIndex == index
                                ? Colors.black
                                : AppColor().greySecondary),
                      ),
                      trailing: widget.selectedIndex == index
                          ? Icon(
                              Icons.check_circle,
                              color: AppColor().greentxt,
                              size: 24,
                            )
                          : null,
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                )),
            // SizedBox(height: 1,)
          ],
        ),
      );
}
