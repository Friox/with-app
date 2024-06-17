import 'package:app/constants/layout_constants.dart';
import 'package:app/providers/notifiers/auth_notifier.dart';
import 'package:app/screens/setting/login_screen.dart';
import 'package:app/screens/setting/profile_detail_screen.dart';
import 'package:app/screens/setting/widgets/profile_card.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

enum Setting4 { item1, item2 }

class _SettingScreenState extends ConsumerState<SettingScreen> {

  bool setting1 = false;
  bool setting2 = false;
  int setting3 = 2;
  Setting4 setting4 = Setting4.item2;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Setting',
              subTitle: '서비스 및 프로필 설정',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black.withOpacity(0.05),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        if (authState.isValid) {
                          // 로그인 정보가 있을때 프로필 디테일
                          return ProfileDetailScreen();
                        } else {
                          // 없을때 로그인 화면
                          return LoginScreen();
                        }
                      },)
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: ProfileCard()
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black.withOpacity(0.05),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('어플리케이션', style: TextStyle(
                            fontVariations: LayoutConstants.fontWeightBold,
                            color: Colors.black.withOpacity(0.4)
                          )),
                          SizedBox(width: 4,),
                          //Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4), size: 16,)
                        ],
                      ),
                      SizedBox(height: 8,),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            setting1 = !setting1;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('어플리케이션 알림 활성화', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('알림을 활성화합니다')
                              ],
                            ),
                            Switch(
                              value: setting1,
                              onChanged: (value) {
                                setState(() {
                                  setting1 = value;
                        
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 0),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            setting2 = !setting2;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('심야시간 알림 허용', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('00:00 ~ 07:00 알림을 허용합니다')
                              ],
                            ),
                            Checkbox(
                              value: setting2,
                              onChanged: (value) {
                                setState(() {
                                  setting2 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 0),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('테마 설정', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('앱의 테마를 설정합니다')
                              ],
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black.withOpacity(0.3),
                                size: 20
                              ),
                            )
                            
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
            SizedBox(height: 24,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black.withOpacity(0.05),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('지원', style: TextStyle(
                            fontVariations: LayoutConstants.fontWeightBold,
                            color: Colors.black.withOpacity(0.4)
                          )),
                          SizedBox(width: 4,),
                          //Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4), size: 16,)
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('기술지원 문의', style: TextStyle(
                                fontSize: 16,
                                fontVariations: LayoutConstants.fontWeightSemiBold
                              ),),
                              Text('기술적인 문제가 있으신가요?')
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {
                              
                            },
                            child: Text('문의'),
                          )
                        ],
                      ),
                      Divider(thickness: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('고객센터 연결', style: TextStyle(
                                fontSize: 16,
                                fontVariations: LayoutConstants.fontWeightSemiBold
                              ),),
                              Text('연락주셔도 괜찮아요')
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {
                              
                            },
                            child: Text('연결'),
                          )
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}