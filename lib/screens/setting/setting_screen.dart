import 'package:app/constants/layout_constants.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.headerPaddingVertical),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Setting',
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