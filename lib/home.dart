import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_projem/common/screen/list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _tabs = const [
    // todo:  Open with bloc
   ListScreen(),
   ListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('TeamKraken'),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.phone_iphone), label: 'MobileDevelopment'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Design')
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}
