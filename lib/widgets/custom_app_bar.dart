import 'package:app/constants/layout_constants.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.actions});

  final List<Widget> actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      actions: widget.actions,
      titleSpacing: Navigator.canPop(context) ? 0 : 32,
      shape: Border(
        bottom: BorderSide(
          color: Colors.black.withOpacity(0.1),
          width: 1
        )
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      title: EasyRichText(
        "together: With",
        defaultStyle: TextStyle(fontSize: 20),
        patternList: [
          EasyRichTextPattern(
            targetString: "With",
            style: TextStyle(
              color: Color(0xFFF1C40F),
              fontVariations: LayoutConstants.fontWeightBlack
            )
          )
        ],
      ),
    );
  }
}