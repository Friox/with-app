import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:app/screens/home/widgets/mission_list_item.dart';
import 'package:app/widgets/container_card.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Mission> missionData = [
    Mission(title: '미션 1', family: '패밀리 1'),
    Mission(title: '미션 1', family: '패밀리 1', isFinished: true),
    Mission(title: '미션 1', family: '패밀리 1'),
    Mission(title: '미션 1', family: '패밀리 1', isFinished: true),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Home',
              subTitle: '부제목, 사용안하면 제거가능',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Column(
                children: [
                  ContainerCard(
                    title: '미션',
                    subTitle: '4개의 미션 중 n개 완료',
                    onClick: () {
                      
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            itemCount: missionData.length,
                            itemBuilder: (context, index) {
                              return MissionListItem(mission: missionData[index]);
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 8,),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 28,),
                  ContainerCard(
                    title: '패밀리',
                    subTitle: '부제목, 사용안하면 제거가능',
                    onClick: () {
                      
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 104,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.grey,
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 16,),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 28,),
                  ContainerCard(
                    title: '다마고치',
                    subTitle: '매일 성장하는 소중한 친구!',
                    onClick: () {
                      
                    },
                    child: Placeholder(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}