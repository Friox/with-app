import 'package:app/constants/layout_constants.dart';
import 'package:app/screens/setting/profile_detail_screen.dart';
import 'package:app/screens/setting/widgets/profile_card.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

enum Setting4 { item1, item2 }

class _SettingScreenState extends State<SettingScreen> {

  bool setting1 = false;
  bool setting2 = false;
  int setting3 = 2;
  Setting4 setting4 = Setting4.item2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: LayoutConstants.containerPadding),
        child: Column(
          children: [
            ScreenHeader(
              title: 'Setting',
              subTitle: '어플리케이션 설정',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Card(
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
                      MaterialPageRoute(builder: (context) => ProfileDetailScreen(),)
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
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Card(
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
                          Text('Section 1', style: TextStyle(
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
                                Text('Setting Title', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('Switch')
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
                                Text('Setting Title', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('Checkbox')
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
                                Text('Setting Title', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('New Page')
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
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Card(
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
                          Text('Section 2', style: TextStyle(
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
                                Text('Setting Title', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('Outlined Button')
                              ],
                            ),
                            OutlinedButton(
                              onPressed: () {
                                
                              },
                              child: Text('Button'),
                            )
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
                                Text('Setting Title', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('Dropdown Button')
                              ],
                            ),
                            DropdownButton(
                              value: setting3,
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text('Item 1'),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text('Item 2'),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text('Item 3'),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text('Item 4'),
                                )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  setting3 = value!;
                                });
                              },
                            )
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
                                Text('Setting Title', style: TextStyle(
                                  fontSize: 16,
                                  fontVariations: LayoutConstants.fontWeightSemiBold
                                ),),
                                Text('Segmented Button')
                              ],
                            ),
                            SegmentedButton(
                              segments: [
                                ButtonSegment<Setting4>(
                                  value: Setting4.item1,
                                  label: Text('1')
                                ),
                                ButtonSegment<Setting4>(
                                  value: Setting4.item2,
                                  label: Text('2')
                                ),
                              ],
                              selected: <Setting4>{setting4},
                              onSelectionChanged: (p0) {
                                setState(() {
                                  setting4 = p0.first;
                                });
                              },
                            )
                            
                          ],
                        ),
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