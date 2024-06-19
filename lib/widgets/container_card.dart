import 'package:app/constants/layout_constants.dart';
import 'package:flutter/material.dart';

class ContainerCard extends StatefulWidget {
  const ContainerCard({
    super.key,
    this.title,
    this.subTitle,
    this.onClick,
    required this.child,
    this.height,
    this.icon,
    this.noPadding = false
  });

  final String? title;
  final String? subTitle;
  final VoidCallback? onClick;
  final Widget child;
  final double? height;
  final IconData? icon;
  final bool noPadding;

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LayoutConstants.containerCornerRadius),
        border: Border.all(
          width: 1,
          color: Theme.of(context).primaryColor
        )
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null) Text(
                    widget.title!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(LayoutConstants.containerTitleOpacity),
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    )
                  ),
                  if (widget.subTitle != null) Text(
                    widget.subTitle!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(LayoutConstants.containerTitleOpacity),
                      fontSize: 14
                    )
                  )
                ],
              ),
              if (widget.title != null && widget.onClick != null) GestureDetector(
                onTap: widget.onClick,
                child: Icon(widget.icon ?? Icons.arrow_forward_ios, color: Colors.black.withOpacity(LayoutConstants.containerTitleOpacity),)
              )
            ],
          ),
          Container(
            padding: (widget.title != null) ? EdgeInsets.only(top: widget.noPadding ? 0 : 16) : EdgeInsets.zero,
            child: widget.child,
          )
          // Text('asdf')
        ],
      ),
    );
  }
}