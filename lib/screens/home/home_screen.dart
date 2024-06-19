import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:app/providers/notifiers/auth_notifier.dart';
import 'package:app/providers/repositories/mission_repository.dart';
import 'package:app/screens/family/family_detail_screen.dart';
import 'package:app/screens/family/family_search_screen.dart';
import 'package:app/screens/home/widgets/mission_list_item.dart';
import 'package:app/screens/mission/mission_list_screen.dart';
import 'package:app/widgets/container_card.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

final container = ProviderContainer();

class _HomeScreenState extends ConsumerState<HomeScreen> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;
  
  final MissionRepository missionRepository = MissionRepository(container);
  final List<Mission> missions = [
    Mission(
      contents: '코딩 가르쳐주기',
      createUserU: CreateUserU(
        realname: '이주환'
      ),
      exp: 50,
      expirationDate: DateTime(2024, 6, 17, 23, 59),
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
    )
  ];

  bool hasFamily = false;
  String? familyName = '';
  DateTime familyDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Home',
              subTitle: '가족에게 한걸음 더',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Column(
                children: [
                  ContainerCard(
                    noPadding: !(authState.isValid && hasFamily),
                    title: '나의 패밀리',
                    subTitle: authState.isValid ? '패밀리에 가입되어 ${hasFamily ? '있어요' : '있지 않아요'}' : '먼저 로그인해주세요!',
                    onClick: authState.isValid ? (hasFamily ? () async {
                      bool? exit = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FamilyDetailScreen(familyName: familyName ?? 'Unknown',),)
                      );
                      if (exit ?? false) {
                        setState(() {
                          hasFamily = false;
                          familyName = '';
                        });
                      }
                    } : () async {
                      final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FamilySearchScreen(),));
                      setState(() {
                        hasFamily = result != null;
                        familyName = result;
                      });
                    }) : null,
                    icon: !hasFamily ? Icons.search : null,
                    child: Visibility(
                      visible: authState.isValid && hasFamily,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('동의 패밀리', style: TextStyle(
                              fontSize: 20,
                              fontVariations: LayoutConstants.fontWeightBold
                            ),),
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.flag, size: 12, color: LayoutConstants.brandColor,),
                                SizedBox(width: 4,),
                                Text('2024. 06. 16', style: TextStyle(color: Colors.black.withOpacity(0.5)),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28,),
                  ContainerCard(
                    title: '미션',
                    subTitle: authState.isValid ? (hasFamily ? '완료하지 못한 3개의 미션이 있어요' : '패밀리에 가입되어 있지 않아요') : '먼저 로그인해주세요',
                    onClick: (authState.isValid && hasFamily) ? () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MissionListScreen(),));
                    } : null,
                    noPadding: !(authState.isValid && hasFamily),
                    child: Visibility(
                      visible: authState.isValid && hasFamily,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView.separated(
                              itemCount: missions.length,
                              itemBuilder: (context, index) {
                                return MissionListItem(mission: missions[index]);
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 8,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 28,),
                  ContainerCard(
                    title: '다마고치',
                    subTitle: authState.isValid ? '매일 성장하는 소중한 친구' : '먼저 로그인해주세요',
                    onClick: authState.isValid ? () {
                      
                    } : null,
                    noPadding: !authState.isValid,
                    child: Visibility(
                      visible: authState.isValid,
                      child: Image.asset('assets/images/tamagotchi.png')
                    ),
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