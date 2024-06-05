import 'package:app/constants/layout_constants.dart';
import 'package:app/screens/diary/diary_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/question/question_screen.dart';
import 'package:app/screens/setting/setting_screen.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'together: With',
      theme: ThemeData(
        primaryColor: Color(0xFFF1C40F),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF1C40F)),
        useMaterial3: true,
        fontFamily: 'Pretendard'
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIdx = 0;

  List<Map> pageData = [
    {
      'title': 'Home',
      'widget': HomeScreen(),
      'dest': NavigationDestination(
        selectedIcon: Icon(Icons.home, color: Colors.white,),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      'actions': <Widget>[
        Padding(
          // 내부 8, 외부 4.
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
          
            },
            icon: Icon(Icons.account_circle_rounded)
          ),
        ),
      ]
    },
    {
      'title': 'Q&A',
      'widget': QuestionScreen(),
      'dest': NavigationDestination(
        selectedIcon: Icon(Icons.question_answer, color: Colors.white,),
        icon: Icon(Icons.question_answer_outlined),
        label: 'Q&A',
      ),
      'actions': <Widget>[],
      'fab': FloatingActionButton(
        
        onPressed: () {
          
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      )
    },
    {
      'title': 'Diary',
      'widget': DiaryScreen(),
      'dest': NavigationDestination(
        selectedIcon: Icon(Icons.book, color: Colors.white,),
        icon: Icon(Icons.book_outlined),
        label: 'Diary',
      ),
      'actions': <Widget>[],
      'fab': FloatingActionButton(
        onPressed: () {
          
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      )
    },
    {
      'title': 'Setting',
      'widget': SettingScreen(),
      'dest': NavigationDestination(
        selectedIcon: Icon(Icons.settings, color: Colors.white,),
        icon: Icon(Icons.settings_outlined),
        label: 'Setting',
      ),
      'actions': <Widget>[]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black.withOpacity(0.1),
              width: 1
            )
          )
        ),
        child: NavigationBar(
          indicatorColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIdx = index;
            });
          },
          selectedIndex: currentPageIdx,
          destinations: [ for (var el in pageData) el['dest'] ]
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        actions: pageData[currentPageIdx]['actions'],
        titleSpacing: 32,
        shape: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 1
          )
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: EasyRichText(
          "together: With",
          defaultStyle: TextStyle(fontSize: 20),
          patternList: [
            EasyRichTextPattern(
              targetString: "With",
              style: TextStyle(
                color: Color(0xFFF1C40F),
                fontVariations: LayoutConstants.fontWeightBlack
              )
            )
          ],
        ),
      ),
      body: [
        HomeScreen(),
        QuestionScreen(),
        DiaryScreen(),
        SettingScreen()
      ][currentPageIdx],
      floatingActionButton: pageData[currentPageIdx]['fab'],
    );
  }
}