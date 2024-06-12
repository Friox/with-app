import 'package:flutter/material.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:app/widgets/container_card.dart';
import 'package:app/constants/layout_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Sentiment {
  unknown(icon: FontAwesomeIcons.circleQuestion),
  angry(icon: FontAwesomeIcons.faceAngry),
  sad(icon: FontAwesomeIcons.faceSadTear),
  normal(icon: FontAwesomeIcons.faceMeh),
  happy(icon: FontAwesomeIcons.faceSmile),
  veryhappy(icon: FontAwesomeIcons.faceLaughBeam);

  final IconData icon;
  const Sentiment({required this.icon});
}

class DiaryWrite extends StatefulWidget {
  const DiaryWrite({super.key});

  @override
  State<DiaryWrite> createState() => _DiaryWriteState();
}

class _DiaryWriteState extends State<DiaryWrite> {
  var now = DateTime.now();
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstants.containerPadding),
                child: Column(
                  children: [
                    ContainerCard(
                        child: Column(
                      children: [
                        Text(
                          DateFormat("yyyy년 MM월 dd일 (E)", 'ko_KR').format(now),
                          style: TextStyle(fontFamily: 'jkid', fontSize: 15),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('오늘의 기분',
                            style: TextStyle(fontFamily: 'jkid'),
                            textAlign: TextAlign.start),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(Sentiment.unknown.icon),
                              iconSize: 22,
                              visualDensity: VisualDensity.compact,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(Sentiment.angry.icon),
                              iconSize: 22,
                              visualDensity: VisualDensity.compact,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(Sentiment.sad.icon),
                              iconSize: 22,
                              visualDensity: VisualDensity.compact,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(Sentiment.normal.icon),
                              iconSize: 22,
                              visualDensity: VisualDensity.compact,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(Sentiment.happy.icon),
                              iconSize: 22,
                              visualDensity: VisualDensity.compact,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: FaIcon(Sentiment.veryhappy.icon),
                              iconSize: 22,
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        ),
                        TextField(
                          style: TextStyle(fontFamily: 'jkid'),
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: '제목'),
                        ),
                        Row(
                          children: [
                            Text(
                              '일기 공개하기',
                              style: TextStyle(fontFamily: 'jkid'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: ischecked,
                                onChanged: (value) {
                                  setState(() {
                                    ischecked = value!;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 450,
                          child: TextField(
                            style: TextStyle(fontFamily: 'jkid'),
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '오늘은 어떤 하루였나요',
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    minimumSize: Size(50, 30),
                    backgroundColor: const Color(0xFFF1C40F),
                    elevation: 2,
                    alignment: Alignment.center),
                child: Text(
                  '작성 완료',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontVariations: LayoutConstants.fontWeightBold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
