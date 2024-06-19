import 'package:app/constants/layout_constants.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FamilyDetailScreen extends StatefulWidget {
  const FamilyDetailScreen({super.key, required this.familyName});

  final String familyName;

  @override
  State<FamilyDetailScreen> createState() => _FamilyDetailScreenState();
}

class _FamilyDetailScreenState extends State<FamilyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(actions: [],),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScreenHeader(
                title: '패밀리 상세정보',
                subTitle: widget.familyName,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                child: Card(
                  margin: EdgeInsets.zero,
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
                            Text('패밀리 정보', style: TextStyle(
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
                            Text('패밀리 생성 일자', style: TextStyle(
                              // fontSize: 16
                            )),
                            Text('2024.06.19')
                          ],
                        ),
                        Divider(thickness: 0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('패밀리 멤버 인원수', style: TextStyle(
                              // fontSize: 16
                            )),
                            Text('5 개')
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 24,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                child: Card(
                  margin: EdgeInsets.zero,
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
                            Text('패밀리 데이터', style: TextStyle(
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
                            Text('작성된 일기', style: TextStyle(
                              // fontSize: 16
                            )),
                            Text('20 개')
                          ],
                        ),
                        Divider(thickness: 0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('댓글 총 개수', style: TextStyle(
                              // fontSize: 16
                            )),
                            Text('10 개')
                          ],
                        ),
                        Divider(thickness: 0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('생성된 미션', style: TextStyle(
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
              SizedBox(height: 24,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    HapticFeedback.mediumImpact();
                    bool? exit = await showModalBottomSheet(
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
                                  Text('패밀리 탈퇴', style: TextStyle(
                                    fontSize: 24,
                                    fontVariations: LayoutConstants.fontWeightBold
                                  )),
                                  SizedBox(height: 8,),
                                  Text('패밀리를 탈퇴하면 관련 기능을 사용할 수 없어요.', style: TextStyle(fontSize: 16),),
                                  Text('그래도 탈퇴할까요?', style: TextStyle(fontSize: 16),),
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
                                          onPressed: () async {
                                            Navigator.pop(context, true);
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
                    if (!context.mounted) return;
                    if (exit ?? false) Navigator.pop(context, true);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    foregroundColor: Colors.red,
                    
                  ),
                  child: Text('패밀리 탈퇴'),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}