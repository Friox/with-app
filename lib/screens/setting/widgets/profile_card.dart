import 'package:app/constants/layout_constants.dart';
import 'package:app/providers/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

double? expToPercent(num? value) {
  if (value == null) return null;
  return ((value % 100) / 100);
}

int? expToCurrentLevel(num? value) {
  if (value == null) return null;
  return (value / 100).floor() + 1;
}

class ProfileCard extends ConsumerStatefulWidget {
  const ProfileCard({super.key});

  @override
  ConsumerState<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends ConsumerState<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final currentLevel = expToCurrentLevel(authState.userProfile?.exp);
    final nextLevel = (currentLevel ?? -1) + 1;
    final levelPercent = expToPercent(authState.userProfile?.exp);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('프로필', style: TextStyle(
              fontVariations: LayoutConstants.fontWeightBold,
              color: Colors.black.withOpacity(0.4)
            )),
            SizedBox(width: 4,),
            Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.4), size: 16,)
          ],
        ),
        SizedBox(height: 16,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            authState.isValid ? CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo_space.png'),
              radius: 36,
            ) : CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.1),
              radius: 36,
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Skeletonizer(
                containersColor: Colors.black.withOpacity(0.1),
                enabled: !authState.isValid,
                effect: SoldColorEffect(color: Colors.black.withOpacity(0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton.keep(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(authState.isValid ? authState.userProfile?.nickname ?? 'nickname' : '로그인이 필요합니다', style: TextStyle(
                            fontSize: 20,
                            fontVariations: LayoutConstants.fontWeightBold
                          )),
                          Text(authState.isValid ? authState.userProfile?.realname ?? 'realname' : '여기를 눌러 로그인해주세요!'),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('LV.${authState.isValid ? currentLevel : 0}', style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3),
                              fontVariations: LayoutConstants.fontWeightBold
                            ),),
                            Text('LV.${authState.isValid ? nextLevel : 0}', style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3),
                              fontVariations: LayoutConstants.fontWeightBold
                            ))
                          ],
                        ),
                        SizedBox(height: 4,),
                        LinearProgressIndicator(
                          value: authState.isValid ? levelPercent ?? 0 : 0,
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation(LayoutConstants.brandColor),
                        ),
                        SizedBox(height: 4,),
                        Text('(${authState.isValid ? authState.userProfile?.exp ?? 0 : 0} / ${authState.isValid ? ((currentLevel ?? 0)) * 100 : 0})', style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.3),
                          fontVariations: LayoutConstants.fontWeightBold
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}