import 'package:app/src/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ScreenHeader(
            title: 'Q&A',
            showProfile: true,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 330,
                height: 380,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFF1C40F), width: 1),
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Column(
                  children: [
                    Row(children: [
                      Text(
                        '질문',
                        style:
                            TextStyle(color: Color(0xFF666666), fontSize: 18),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF666666))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.radio_button_unchecked),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Test question 1',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Text(
                              'who asked',
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '빠른 답변',
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.radio_button_unchecked),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Test question 2',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Text(
                              'who asked',
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 11),
                            )
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '빠른 답변',
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          Spacer(flex: 1),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                minimumSize: Size(230, 45),
                backgroundColor: const Color(0xFFF1C40F),
                elevation: 2,
                alignment: Alignment.center),
            child: Text('질문 답변하러 가기',
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '나에게 온 질문에 답변해보아요',
            style: TextStyle(color: Color(0xFF666666)),
          ),
          Spacer(flex: 1),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                minimumSize: Size(230, 45),
                backgroundColor: const Color(0xFFF1C40F),
                elevation: 2,
                alignment: Alignment.center),
            child: Text(
              '질문하러 가기',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '궁금한 점을 질문해보아요',
            style: TextStyle(color: Color(0xFF666666)),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
