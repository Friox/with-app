import 'package:app/constants/layout_constants.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.headerPaddingVertical),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Home',
              subTitle: '부제목, 사용안하면 제거가능',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}