import 'package:flutter/widgets.dart';

import '../widgets/button.dart';
import '../widgets/scaffold.dart';
import '../widgets/bottom_navigate.dart';

import './select_pixel.dart';
import './feed/pixel_list.dart';

class Home extends StatefulWidget {
  Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static BuildContext _context;
  static int _currentIndex;

  final List<Widget> _pages = [
    PixelList(),
    Text('search'),
    SelectPixel(),
    Center(
      child: Column(
        children: [
          Text('My Pixels'),
          Button(
            label: 'See pixel',
            onPressed: () {
              print('elias');
              Navigator.of(_context).pushNamed('/pixel_detail');
            },
          ),
          Button(
              label: 'Send pixel',
              onPressed: () {
                Navigator.of(_context).pushNamed('/select_pixel');
              }),
          Button(
              label: 'List pixels',
              onPressed: () {
                Navigator.of(_context).pushNamed('/feed');
              }),
        ],
      ),
    ),
    Text('Profile')
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    setState(() => {_context = context});
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
