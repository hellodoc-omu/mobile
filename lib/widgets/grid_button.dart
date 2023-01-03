import 'package:flutter/material.dart';
import 'package:hellodoc/utilities/utilities.dart';

class GridButton extends StatefulWidget {
  const GridButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
    this.iconSize = 64,
    required this.title,
    this.titleColor = Colors.white,
    this.titleSize = 24,
  });

  final Function() onTap;

  final Color? color;
  final IconData icon;
  final double iconSize;

  final String title;
  final Color titleColor;
  final double titleSize;

  @override
  State<GridButton> createState() => _GridButton();
}

class _GridButton extends State<GridButton> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: widget.titleColor,
      fontSize: widget.titleSize,
    );

    var gridButton = Container(
      color: widget.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.titleColor,
            size: widget.iconSize,
          ),
          Text(
            widget.title,
            style: textStyle,
          ),
        ],
      ),
    );

    return bindTapEventToWidget(gridButton, widget.onTap);
  }
}
