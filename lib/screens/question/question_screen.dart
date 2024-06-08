import 'package:app/constants/layout_constants.dart';
import 'package:app/widgets/container_card.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<String> dropdownList = ['전체', '백승준', '이승훈', '이주환', '최영준', '한여준'];
  String selectedval = '전체';

  final List<String> searchList = ['전체', '백승준', '이승훈', '이주환', '최영준', '한여준'];
  String searchval = '전체';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: LayoutConstants.headerPaddingVertical),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Q&A',
              subTitle: '궁금한 것을 묻고 답해보아요',
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: LayoutConstants.containerPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '질문하기',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontVariations: LayoutConstants.fontWeightBold),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            minimumSize: Size(50, 25),
                            backgroundColor: const Color(0xFFF1C40F),
                            elevation: 2,
                            alignment: Alignment.center),
                        child: Text(
                          '완료',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontVariations: LayoutConstants.fontWeightBold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '누구에게 질문하고 싶나요?',
                        style: TextStyle(color: Color(0xFF666666)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: searchval,
                          onChanged: (String? newVal) {
                            setState(() {
                              searchval = newVal!;
                            });
                          },
                          items: searchList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          dropdownColor: Colors.white,
                          iconSize: 20,
                        ),
                      ),
                    ],
                  ),
                  ContainerCard(
                      child: SizedBox(
                    height: 150,
                    child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            hintText: '무엇을 물어보고 싶나요?'),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black)),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '질문 답변하기',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontVariations: LayoutConstants.fontWeightBold),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF1C40F),
                            border: Border.all(
                                color: const Color(0xFFF1C40F), width: 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedval,
                            onChanged: (String? newVal) {
                              setState(() {
                                selectedval = newVal!;
                              });
                            },
                            items: searchList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            dropdownColor: Colors.white,
                            iconSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ContainerCard(
                    height: 220,
                    child: SingleChildScrollView(
                      child: Column(
                        //shrinkWrap: true,
                        children: [
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
                                    '첫 번째 질문',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Text(
                                    '질문한 패밀리 이름',
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     '빠른 답변',
                              //     style: TextStyle(
                              //         color: Color(0xFF666666), fontSize: 11),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
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
                                    '두 번째 질문',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Text(
                                    '질문한 패밀리 이름',
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     '빠른 답변',
                              //     style: TextStyle(
                              //         color: Color(0xFF666666), fontSize: 11),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
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
                                    '세 번째 질문',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  Text(
                                    '질문한 패밀리 이름',
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 11,
                                    ),
                                  )
                                ],
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     '빠른 답변',
                              //     style: TextStyle(
                              //         color: Color(0xFF666666), fontSize: 11),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
