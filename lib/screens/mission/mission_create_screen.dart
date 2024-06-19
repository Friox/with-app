import 'package:app/constants/layout_constants.dart';
import 'package:app/models/mission_model.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MissionCreateScreen extends StatefulWidget {
  const MissionCreateScreen({super.key});

  @override
  State<MissionCreateScreen> createState() => _MissionCreateScreenState();
}

const List<String> userList = ["이주환", "최영준", "한여준", "백승준"];

class _MissionCreateScreenState extends State<MissionCreateScreen> {

  String currentUser = userList[0];
  int exp = 50;
  DateTime? expireDate;

  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(actions: [],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScreenHeader(
              title: '미션 생성',
              subTitle: '패밀리만의 미션을 만들어보세요',
              filledButton: FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context, Mission(
                    contents: _contentController.text,
                    exp: exp,
                    expirationDate: expireDate?.add(Duration(hours: 23, minutes: 59)),
                    status: 0,
                    targetUserU: CreateUserU(
                      realname: currentUser
                    )
                  ));
                },
                label: Text('생성'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green
                ),
              ),
              // subTitle: '',
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('누구에게 미션을 부여할까요?', style: TextStyle(fontSize: 16),),
                      SizedBox(width: 16,),
                      DropdownButton(
                        value: currentUser,
                        items: userList.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            currentUser = value!;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(expireDate == null ? '만료날짜를 정해주세요' : '만료: ${DateFormat('yyyy년 MM월 dd일').format(expireDate!)}', style: TextStyle(fontSize: 16),),
                      SizedBox(width: 16,),
                      OutlinedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: expireDate ?? DateTime.now().add(Duration(days: 3)),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 3650))
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                expireDate = value;
                              });
                            }
                          },);
                        },
                        child: Text('선택'),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  TextField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '미션 내용'
                    ),
                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                  ),
                  SizedBox(height: 32,),
                  Text('경험치', style: TextStyle(
                    fontSize: 16,
                    fontVariations: LayoutConstants.fontWeightBold,
                    color: Colors.black.withOpacity(0.4)
                  )),
                  SizedBox(height: 4,),
                  SegmentedButton<int>(
                    showSelectedIcon: false,
                    segments: [
                      ButtonSegment<int>(
                        value: 10,
                        label: Text('10'),
                      ),
                      ButtonSegment<int>(
                        value: 20,
                        label: Text('20'),
                      ),
                      ButtonSegment<int>(
                        value: 50,
                        label: Text('50'),
                      ),
                      ButtonSegment<int>(
                        value: 100,
                        label: Text('100'),
                      ),
                      ButtonSegment<int>(
                        value: 200,
                        label: Text('200'),
                      )
                    ],
                    selected: <int>{exp},
                    onSelectionChanged: (p0) {
                      setState(() {
                        exp = p0.first;
                      });
                    },
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}