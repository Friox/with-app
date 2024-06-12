import 'package:app/constants/layout_constants.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Profile', style: TextStyle(
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
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 36,
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('devFriox', style: TextStyle(
                        fontSize: 20,
                        fontVariations: LayoutConstants.fontWeightBold
                      )),
                      Text('이승훈'),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('LV.1', style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.3),
                            fontVariations: LayoutConstants.fontWeightBold
                          ),),
                          Text('LV.2', style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.3),
                            fontVariations: LayoutConstants.fontWeightBold
                          ))
                        ],
                      ),
                      SizedBox(height: 4,),
                      LinearProgressIndicator(
                        value: 0.5,
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation(LayoutConstants.brandColor),
                      ),
                      SizedBox(height: 4,),
                      Text('(1000 / 2000)', style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.3),
                        fontVariations: LayoutConstants.fontWeightBold
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}