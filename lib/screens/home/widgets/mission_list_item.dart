import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
            Icon(Icons.directions_run),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mission.contents ?? 'Mission Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontVariations: LayoutConstants.fontWeightBold
                  )
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.clock, size: 12, color: Colors.black.withOpacity(0.25),),
                    SizedBox(width: 4,),
                    Text(
                      '${widget.mission.expirationDate != null ? DateFormat('MM.dd HH:mm').format(widget.mission.expirationDate!) : '알 수 없음'} 까지',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.4)
                      )
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.personCircleQuestion, size: 12, color: Colors.black.withOpacity(0.25),),
                    SizedBox(width: 4,),
                    Text(
                      widget.mission.createUserU?.realname ?? '알 수 없음',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.4)
                      )
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Text('+ ${widget.mission.exp}XP')
      ],
    );
  }
}