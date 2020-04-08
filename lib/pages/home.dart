import 'package:flutter/widgets.dart';

import '../widgets/scaffold.dart';
import '../widgets/bottom_navigate.dart';

import './select_pixel.dart';
import './feed/feed_page.dart';
import './home_helper.dart';

class Home extends StatefulWidget {
  Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  final List<Widget> _pages = [
    FeedPage(),
    Text('search'),
    SelectPixel(),
    HomeHelper(),
    Text('Profile')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigate:
          BottomNavigate(currentIndex: _currentIndex, onTap: _onTap),
      body: SafeArea(child: _pages[_currentIndex]),
    );
  }

  void _onTap(int index) {
    setState(() => {_currentIndex = index});
  }
}
