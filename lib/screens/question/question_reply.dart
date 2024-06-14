import 'package:flutter/material.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/container_card.dart';
import 'package:app/constants/layout_constants.dart';

class QuestionReply extends StatefulWidget {
  const QuestionReply({super.key});

  @override
  State<QuestionReply> createState() => _QuestionReplyState();
}

class _QuestionReplyState extends State<QuestionReply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        actions: [],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstants.containerPadding),
                  child: Column(
                    children: [
                      ContainerCard(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 100,
                            child: Text(
                              ' 번째 질문',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: Text(
                              '질문자 : ',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            child: TextField(
                              style: TextStyle(fontSize: 14),
                              maxLines: null,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: '질문에 답변해보아요',
                                  hintStyle: TextStyle(fontSize: 12)),
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
                      minimumSize: Size(90, 30),
                      backgroundColor: const Color(0xFFF1C40F),
                      elevation: 2,
                      alignment: Alignment.center),
                  child: Text(
                    '답변 완료',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontVariations: LayoutConstants.fontWeightBold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
