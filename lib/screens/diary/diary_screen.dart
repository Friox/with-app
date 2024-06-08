import 'dart:math';

import 'package:app/constants/layout_constants.dart';
import 'package:app/models/diary_model.dart';
import 'package:app/screens/diary/widgets/diary_list_item.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        dividerColor: Colors.black.withOpacity(0.1),
        dividerHeight: 1,
        tabs: [
          Tab(
            text: '내 일기',
          ),
          Tab(
            child: Text('다른 일기'),
          )
        ],
        indicatorWeight: 2,
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

class _DiaryScreenState extends State<DiaryScreen> with AutomaticKeepAliveClientMixin {

  List<String> name = ["이승훈", "한여준", "이주환", "백승준", "최영준"];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: ScreenHeader(
                title: 'Diary',
                subTitle: '오늘 일기를 작성하지 않았어요',
                filledButton: FilledButton.icon(
                  onPressed: () {

                  },
                  label: Text('작성'),
                  icon: Icon(Icons.add),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green
                  )
                )
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: TabBarDelegate(),
            )
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomScrollView(
              key: PageStorageKey<String>('tab1'),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(bottom: LayoutConstants.headerPaddingVertical),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => DiaryListItem(data: Diary(
                        date: DateTime.now().subtract(Duration(days: index)),
                        writer: name[Random().nextInt(name.length - 1)],
                        sentiment: index % 6
                      )),
                      childCount: 20
                    ),
                  ),
                )
              ]
            ),
            CustomScrollView(
              key: PageStorageKey<String>('tab2'),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(bottom: LayoutConstants.headerPaddingVertical),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => DiaryListItem(data: Diary(
                        date: DateTime.now().subtract(Duration(days: index)),
                        writer: name[Random().nextInt(name.length - 1)],
                        sentiment: index % 6
                      )),
                      childCount: 20
                    ),
                  ),
                )
              ]
            ),
          ],
        )
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}