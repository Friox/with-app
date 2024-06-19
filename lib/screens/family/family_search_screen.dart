import 'package:app/constants/layout_constants.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection
    );
  }
}

class FamilySearchScreen extends StatefulWidget {
  const FamilySearchScreen({super.key});

  @override
  State<FamilySearchScreen> createState() => _FamilySearchScreenState();
}

class _FamilySearchScreenState extends State<FamilySearchScreen> {

  bool isSearched = false;
  bool isSearching = false;
  bool searchFail = false;
  bool isJoining = false;
  final _codeController = TextEditingController();

  void doneEvent() async {
    setState(() {
      isSearching = true;
    });
    final code = _codeController.text;
    await Future.delayed(Duration(milliseconds: 750));
    setState(() {
      isSearched = true;
      searchFail = (code != 'QWERTY');
    });
    setState(() {
      isSearching = false;
    });
  }

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
                title: '패밀리 검색',
                subTitle: 'Search Family',
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                child: Column(
                  children: [
                    TextField(
                      inputFormatters: [ UpperCaseTextFormatter() ],
                      onEditingComplete: doneEvent,
                      maxLength: 6,
                      controller: _codeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '패밀리 코드'
                      ),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    SizedBox(height: 16,),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: !isSearching ? doneEvent : null,
                        child: Text(isSearching ? '검색중...' : '검색'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: LayoutConstants.containerPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('검색된 패밀리${!isSearched ? '' : !searchFail ? ' (1)' : ' (결과없음)'}', style: TextStyle(
                      fontSize: 16,
                      fontVariations: LayoutConstants.fontWeightBold,
                      color: Colors.black.withOpacity(0.4)
                    )),
                    Divider(height: 16, thickness: 0,),
                    SizedBox(height: 4,),
                    Visibility(
                      visible: isSearched && !searchFail,
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: LayoutConstants.brandColor
                          )
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: () {
                            // Sentiment.values.length;
                          },
                          onLongPress: () async {
                            HapticFeedback.mediumImpact();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('동의 패밀리', style: TextStyle(
                                      fontSize: 20,
                                      fontVariations: LayoutConstants.fontWeightBold
                                    )),
                                    SizedBox(height: 4,),
                                    Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.flag, size: 12, color: Colors.black.withOpacity(0.3),),
                                        SizedBox(width: 6,),
                                        Text('2024. 06. 16', style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)
                                        ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.person, size: 12, color: Colors.black.withOpacity(0.3),),
                                        SizedBox(width: 6,),
                                        Text('4명', style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                                OutlinedButton(
                                  onPressed: !isJoining ? () async {
                                    setState(() {
                                      isJoining = true;
                                    });
                                    await Future.delayed(Duration(milliseconds: 700));
                                    setState(() {
                                      isJoining = false;
                                    });
                                    if (!context.mounted) return;
                                    Navigator.pop(context, '동의 패밀리');
                                  } : null,
                                  child: Text('참여'),
                                )
                              ],
                            )
                          ),
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}