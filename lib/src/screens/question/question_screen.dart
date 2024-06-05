import 'package:app/src/widgets/screen_header.dart';
import 'package:flutter/material.dart';

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
                  border: Border.all(color: const Color(0xFFF1C40F), width: 1),
                  borderRadius: BorderRadius.circular(16)),
            ),
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
          Text(
            '나에게 온 질문에 답장해보아요',
            style: TextStyle(color: Color.fromARGB(150, 110, 108, 108)),
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
          Text(
            '궁금한 점을 질문해보아요',
            style: TextStyle(color: Color.fromARGB(150, 110, 108, 108)),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
