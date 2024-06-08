import 'package:app/constants/layout_constants.dart';
import 'package:app/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

enum Sentiment {
  unknown(icon: FontAwesomeIcons.circleQuestion),
  angry(icon: FontAwesomeIcons.faceAngry),
  sad(icon: FontAwesomeIcons.faceSadTear),
  normal(icon: FontAwesomeIcons.faceMeh),
  happy(icon: FontAwesomeIcons.faceSmile),
  veryhappy(icon: FontAwesomeIcons.faceLaughBeam);

  final IconData icon;
  const Sentiment({ required this.icon });
}

class DiaryListItem extends StatefulWidget {
  const DiaryListItem({super.key, required this.data});

  final Diary data;

  @override
  State<DiaryListItem> createState() => _DiaryListItemState();
}

class _DiaryListItemState extends State<DiaryListItem> {
  final DateTime today = DateTime.now();

  bool isToday() {
    return !(
      widget.data.date.year != today.year ||
      widget.data.date.month != today.month ||
      widget.data.date.day != today.day
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: LayoutConstants.headerPaddingVertical,
        top: LayoutConstants.headerPaddingVertical,
        right: LayoutConstants.headerPaddingVertical
      ),
      child: Badge(
        label: isToday() ? Text('Today') : null,
        smallSize: isToday() ? null : 0,
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
              Sentiment.values.length;
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
                        DateFormat("yyyy년 MM월 dd일 (E)", 'ko_KR').format(widget.data.date),
                        style: TextStyle(
                          fontFamily: 'Jkid',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // fontVariations: LayoutConstants.fontWeightBold
                        ),
                      ),
                      Text(
                        '오늘 정말 재밌었다',
                        style: TextStyle(
                          fontFamily: 'jKid'
                        )
                      ),
                      SizedBox(height: 4,),
                      Text(
                        '\'${widget.data.writer}\'의 일기',
                        style: TextStyle(
                          fontFamily: 'jKid'
                        )
                      )
                    ],
                  ),
                  Transform.scale(
                    scale: 4,
                    child: Transform.translate(
                      offset: const Offset(2, -1),
                      child: Opacity(
                        opacity: 0.1,
                        child: FaIcon(Sentiment.values[widget.data.sentiment].icon)
                      )
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