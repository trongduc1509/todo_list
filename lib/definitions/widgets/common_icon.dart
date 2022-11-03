import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({
    Key? key,
    required this.onTab,
    required this.icon,
    this.size = 32,
    this.pading = 5,
    this.background = Colors.grey,
    this.foreground = Colors.black,
  }) : super(key: key);

  final IconData icon;
  final Function() onTab;
  final double size;
  final Color background;
  final Color foreground;
  final double pading;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTab,
        child: Container(
          padding: EdgeInsets.all(pading),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: background,
          ),
          child: Icon(
            icon,
            semanticLabel: icon.fontFamily,
            color: foreground,
            size: size,
          ),
        ),
      );
}
