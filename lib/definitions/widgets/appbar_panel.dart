import 'package:flutter/material.dart';
import 'package:todo_list/definitions/colors.dart';

class CustomAppbarPanel extends StatefulWidget {
  const CustomAppbarPanel(
      {Key? key,
      required this.content,
      required this.panel,
      this.siliverHeight = 66,
      this.callapseHeight,
      this.containerHeght = 31,
      this.isTopColor = true,
      this.pinned = true})
      : super(key: key);

  final Widget panel;
  final Widget content;
  final double? siliverHeight;
  final double? callapseHeight;
  final bool isTopColor;
  final bool pinned;
  final double? containerHeght;

  @override
  State<StatefulWidget> createState() => _CustomAppbarPanel();
}

class _CustomAppbarPanel extends State<CustomAppbarPanel> {
  @override
  Widget build(BuildContext context) => NestedScrollView(
        body: widget.content,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 0,
            collapsedHeight: widget.callapseHeight,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            pinned: widget.pinned,
            expandedHeight: widget.siliverHeight,
            flexibleSpace: Padding(
                child: Container(
                  height: widget.containerHeght,
                  color: widget.isTopColor
                      ? AppColor().blueButton
                      : AppColor().scaffoldBackground,
                ),
                padding: const EdgeInsets.only(bottom: 16)),
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: widget.panel),
            ),
          ),
        ],
      );
}
