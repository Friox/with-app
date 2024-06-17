import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:app/screens/mission/mission_create_screen.dart';
import 'package:app/screens/mission/widgets/mission_inbound_item.dart';
import 'package:app/screens/mission/widgets/mission_outbound_item.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MissionListScreen extends ConsumerStatefulWidget {
  const MissionListScreen({super.key});

  @override
  ConsumerState<MissionListScreen> createState() => _MissionListScreenState();
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onTabChanged;
  const TabBarDelegate({required this.onTabChanged});

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        dividerColor: Colors.black.withOpacity(0.1),
        dividerHeight: 1,
        tabs: [
          Tab(
            text: '받은 미션',
          ),
          Tab(
            child: Text('만든 미션'),
          )
        ],
        indicatorWeight: 2,
        onTap: onTabChanged,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _MissionListScreenState extends ConsumerState<MissionListScreen> {

  int _currentIndex = 0;
  String? token;

  final List<Mission> inboundMission = [
    Mission(
      contents: '코딩 가르쳐주기',
      createUserU: CreateUserU(
        realname: '이주환'
      ),
      exp: 50,
      expirationDate: DateTime(2024, 6, 17, 23, 59),
      status: 1
    ),
    Mission(
      contents: '저녁먹고 설거지하기',
      createUserU: CreateUserU(
        realname: '최영준'
      ),
      exp: 50,
      expirationDate: DateTime(2024, 6, 17, 23, 59),
    ),
    Mission(
      contents: '운동 도와주기',
      createUserU: CreateUserU(
        realname: '한여준'
      ),
      exp: 50,
      expirationDate: DateTime(2024, 6, 17, 23, 59),
      status: 1
    )
  ];

  final List<Mission> outboundMission = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(actions: [],),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: ScreenHeader(
                  title: '미션',
                  subTitle: '가족과 더 가까워지기',
                  filledButton: _currentIndex == 1 ? FilledButton.icon(
                    onPressed: () async {
                      Mission? mission = await Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MissionCreateScreen(),
                      ));
                      if (mission != null) {
                        setState(() {
                          outboundMission.add(mission);
                        });
                      }
                    },
                    label: Text('생성'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green
                    ),
                  ) : null,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate:  TabBarDelegate(
                  onTabChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                ),
              )
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(
                      bottom: LayoutConstants.headerPaddingVertical,
                    ),
                    sliver: SliverList.builder(
                      itemCount: inboundMission.length,
                      itemBuilder: (context, index) => MissionInboundItem(mission: inboundMission[index]),
                    )
                  )
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(
                      bottom: LayoutConstants.headerPaddingVertical,
                    ),
                    sliver: SliverList.builder(
                      itemCount: outboundMission.length,
                      itemBuilder: (context, index) => MissionOutboundItem(mission: outboundMission[outboundMission.length - index - 1]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}