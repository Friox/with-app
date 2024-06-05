import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:flutter/material.dart';

class MissionListItem extends StatefulWidget {
  const MissionListItem({super.key, required this.mission});

  final Mission mission;

  @override
  State<MissionListItem> createState() => _MissionListItemState();
}

class _MissionListItemState extends State<MissionListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            widget.mission.isFinished ? Icon(
              Icons.radio_button_checked,
              color: Colors.green,
            ) : Icon(
              Icons.radio_button_off,
              color: Colors.red,
            ),
            SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mission.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontVariations: LayoutConstants.fontWeightBold
                  )
                ),
                SizedBox(height: 2,),
                Text(
                  widget.mission.family ?? '알 수 없음',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5)
                  )
                )
              ],
            ),
          ],
        ),
        Text('action')
      ],
    );
  }
}