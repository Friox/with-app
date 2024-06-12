import 'package:app/constants/layout_constants.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(actions: [],),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0, bottom: LayoutConstants.containerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 48,
                ),
                SizedBox(height: 16),
                Text('devFriox', style: TextStyle(
                  fontSize: 28,
                  fontVariations: LayoutConstants.fontWeightBold
                ),),
                Text('이승훈', style: TextStyle(
                  fontSize: 16
                ),),
                SizedBox(height: 16,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('LV.1'),
                            Text('LV.2까지 5,000 XP 남음')
                          ],
                        ),
                        SizedBox(height: 4,),
                        LinearProgressIndicator(
                          value: 0.5,
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: Colors.black.withOpacity(0.05),
                          valueColor: AlwaysStoppedAnimation(LayoutConstants.brandColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32.0),
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: OutlinedButton(
                          onPressed: () {
                            
                          },
                          child: Text('액션 1'),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Flexible(
                        fit: FlexFit.tight,
                        child: OutlinedButton(
                          onPressed: () {
                            
                          },
                          child: Text('액션 2'),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                  child: Card(
                    color: Colors.black.withOpacity(0.05),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('정보', style: TextStyle(
                                fontVariations: LayoutConstants.fontWeightBold,
                                color: Colors.black.withOpacity(0.4)
                              )),
                              SizedBox(width: 4,),
                              // Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4), size: 16,)
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('이메일 주소', style: TextStyle(
                                // fontSize: 16
                              )),
                              Text('devFriox@gmail.com')
                            ],
                          ),
                          Divider(thickness: 0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('회원가입 일자', style: TextStyle(
                                // fontSize: 16
                              )),
                              Text('XXXX.XX.XX')
                            ],
                          ),
                          Divider(thickness: 0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('내가 쓴 일기', style: TextStyle(
                                // fontSize: 16
                              )),
                              Text('10 개')
                            ],
                          ),
                        ],
                      ),
                    )
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                  child: Card(
                    color: Colors.black.withOpacity(0.05),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('관리', style: TextStyle(
                                fontVariations: LayoutConstants.fontWeightBold,
                                color: Colors.black.withOpacity(0.4)
                              )),
                              SizedBox(width: 4,),
                              // Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4), size: 16,)
                            ],
                          ),
                          SizedBox(height: 16,),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                // setting1 = !setting1;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('비밀번호 변경', style: TextStyle(
                                      fontSize: 16,
                                      fontVariations: LayoutConstants.fontWeightSemiBold
                                    ),),
                                    Text('Change Password')
                                  ],
                                ),
                                OutlinedButton(
                                  onPressed: () {

                                  },
                                  child: Text('변경'),
                                )
                              ],
                            ),
                          ),
                          Divider(thickness: 0),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                // setting1 = !setting1;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('뭐 넣지?', style: TextStyle(
                                      fontSize: 16,
                                      fontVariations: LayoutConstants.fontWeightSemiBold
                                    ),),
                                    Text('What?')
                                  ],
                                ),
                                OutlinedButton(
                                  onPressed: () {

                                  },
                                  child: Text('버튼임'),
                                )
                              ],
                            ),
                          ),
                          Divider(thickness: 0),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              setState(() {
                                // setting1 = !setting1;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('내가 쓴 일기 모두 삭제', style: TextStyle(
                                      fontSize: 16,
                                      fontVariations: LayoutConstants.fontWeightSemiBold,
                                      color: Colors.red
                                    ),),
                                    Text('Drop all Diary')
                                  ],
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: BorderSide(color: Colors.red)
                                  ),
                                  onPressed: () {
                                    HapticFeedback.mediumImpact();
                                    showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      barrierLabel: "asdf",
                                      useSafeArea: true,
                                      useRootNavigator: true,
                                      showDragHandle: true,
                                      context: context,
                                      builder: (context) => SafeArea(
                                        child: Wrap(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('일기 모두 삭제', style: TextStyle(
                                                    fontSize: 24,
                                                    fontVariations: LayoutConstants.fontWeightBold
                                                  )),
                                                  SizedBox(height: 8,),
                                                  Text('내가 쓴 일기를 모두 삭제합니다.', style: TextStyle(fontSize: 16),),
                                                  Text('이 작업은 되돌릴 수 없습니다, 진행할까요?', style: TextStyle(fontSize: 16),),
                                                  SizedBox(height: 24,),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        fit: FlexFit.tight,
                                                        child: OutlinedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text('아니오'),
                                                        ),
                                                      ),
                                                      SizedBox(width: 16,),
                                                      Flexible(
                                                        fit: FlexFit.tight,
                                                        child: OutlinedButton(
                                                          style: OutlinedButton.styleFrom(
                                                            side: BorderSide(color: Colors.red),
                                                            foregroundColor: Colors.red
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text('예')
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]
                                        ),
                                      )
                                    );
                                  },
                                  child: Text('삭제'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withOpacity(0.3),
                              width: 0.3
                            )
                          )
                        ),
                        child: Row(
                          children: [
                            Text('회원탈퇴', style: TextStyle(color: Colors.black.withOpacity(0.3))),
                            Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black.withOpacity(0.3),),
                          ],
                        ),
                      ),
                      SizedBox(width: 16,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}