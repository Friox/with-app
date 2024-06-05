import 'package:app/constants/layout_constants.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatefulWidget {
  const ScreenHeader({super.key, required this.title, this.subTitle, this.onClick, this.icon});

  final String title;
  final String? subTitle;
  final VoidCallback? onClick;
  final Icon? icon;

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        left: LayoutConstants.containerPadding,
        top: LayoutConstants.headerPaddingVertical,
        right: LayoutConstants.headerPaddingRight,
        bottom: LayoutConstants.headerPaddingVertical
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 28,
                    fontVariations: LayoutConstants.fontWeightBold
                  ),
                ),
                if (widget.subTitle != null) Text(
                  widget.subTitle!,
                  style: TextStyle(
                    fontSize: 16,
                  )
                )
              ],
            ),
          ),
          if (widget.onClick != null && widget.icon != null) Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
              onPressed: widget.onClick,
              icon: widget.icon!,
            ),
          )
        ],
      ),
    );
  }
}