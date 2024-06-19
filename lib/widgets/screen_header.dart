import 'package:app/constants/layout_constants.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatefulWidget {
  const ScreenHeader({
    super.key,
    required this.title,
    this.subTitle,
    this.iconButton,
    this.filledButton
  });

  final String title;
  final String? subTitle;
  final IconButton? iconButton;
  final FilledButton? filledButton;

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(
        left: LayoutConstants.containerPadding,
        top: LayoutConstants.headerPaddingVertical,
        right: widget.iconButton != null ? LayoutConstants.headerPaddingRight : LayoutConstants.containerPadding,
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
          if (widget.iconButton != null) widget.iconButton!
          else if (widget.filledButton != null) widget.filledButton!
        ],
      ),
    );
  }
}