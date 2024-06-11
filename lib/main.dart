import 'package:app/screens/diary/diary_screen.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/question/question_screen.dart';
import 'package:app/screens/setting/setting_screen.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(const MyApp());
}

enum Page { home, qan, diary, setting }

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
  final scaffoldState = GlobalKey<ScaffoldState>();
  Page currentPageIdx = Page.home;

  List<Widget> getActions(Page idx) {
    Map<Page, List<Widget>> data = {};
    if (data[idx] == null) return [];
    return data[idx]!;
  }
  
  FloatingActionButton? getFAB(Page idx) {
    Map<Page, FloatingActionButton> data = {
      Page.qan: FloatingActionButton(
        onPressed: () {

        },
        shape: CircleBorder(),
        child: Icon(Icons.add)
      )
    };
    return data[idx];
  }

  List<Widget> getNavDest() {
    Map<Page, NavigationDestination> data = {
      Page.home: NavigationDestination(
        selectedIcon: Icon(Icons.home, color: Colors.white,),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      Page.qan: NavigationDestination(
        selectedIcon: Icon(Icons.question_answer, color: Colors.white,),
        icon: Icon(Icons.question_answer_outlined),
        label: 'Q&A',
      ),
      Page.diary: NavigationDestination(
        selectedIcon: Icon(Icons.book, color: Colors.white,),
        icon: Icon(Icons.book_outlined),
        label: 'Diary',
      ),
      Page.setting: NavigationDestination(
        selectedIcon: Icon(Icons.settings, color: Colors.white,),
        icon: Icon(Icons.settings_outlined),
        label: 'Setting',
      ),
    };
    return [ for (Page i in Page.values) data[i]! ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
          height: 70,
          indicatorColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIdx = Page.values[index];
            });
          },
          selectedIndex: currentPageIdx.index,
          destinations: getNavDest()
        ),
      ),
      appBar: CustomAppBar(actions: getActions(currentPageIdx)),
      body: [
        HomeScreen(),
        QuestionScreen(),
        DiaryScreen(),
        SettingScreen()
      ][currentPageIdx.index],
      floatingActionButton: getFAB(currentPageIdx),
    );
  }
}