import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MissionInboundItem extends StatefulWidget {
  const MissionInboundItem({super.key, required this.mission});

  final Mission mission;

  @override
  State<MissionInboundItem> createState() => _MissionInboundItemState();
}

class _MissionInboundItemState extends State<MissionInboundItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: LayoutConstants.headerPaddingVertical,
        top: LayoutConstants.headerPaddingVertical,
        right: LayoutConstants.headerPaddingVertical
      ),
      child: Badge(
        label: Text('+ ${widget.mission.exp} XP'),
        alignment: Alignment.topLeft,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: LayoutConstants.brandColor
            )
          ),
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              
            },
            onLongPress: () async {
              HapticFeedback.mediumImpact();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mission.contents ?? 'Mission Title',
                        style: TextStyle(fontSize: 18, fontVariations: LayoutConstants.fontWeightBold),
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
                  Visibility(
                    visible: (widget.mission.status ?? 0) == 1,
                    child: Transform.scale(
                      scale: 4,
                      child: Transform.translate(
                        offset: const Offset(2, 2),
                        child: FaIcon(FontAwesomeIcons.circleCheck, color: Colors.green.withOpacity(0.3))
                      ),
                    ),
                  )
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}