import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter_svg/flutter_svg.dart';

final String homeAsset = 'assets/images/bottom_navigate/home.svg';
final String homeSelectedAsset = 'assets/images/bottom_navigate/home.svg';
final String searchAsset = 'assets/images/bottom_navigate/search.svg';
final String searchSelectedAsset = 'assets/images/bottom_navigate/search.svg';
final String addAsset = 'assets/images/bottom_navigate/add_pixel.svg';
final String addSelectedAsset = 'assets/images/bottom_navigate/add_pixel.svg';
final String gridAsset = 'assets/images/bottom_navigate/grid.svg';
final String gridSelectedAsset = 'assets/images/bottom_navigate/grid.svg';
final String profileAsset = 'assets/images/bottom_navigate/profile.svg';
final String profileSelectedAsset = 'assets/images/bottom_navigate/profile.svg';

final Widget homeAssetWidget =
    SvgPicture.asset(homeAsset, semanticsLabel: 'Home');
final Widget homeSelectedAssetWidget =
    SvgPicture.asset(homeSelectedAsset, semanticsLabel: 'Home');
final Widget searchAssetWidget =
    SvgPicture.asset(searchAsset, semanticsLabel: 'Search pixel');
final Widget searchSelectedAssetWidget =
    SvgPicture.asset(searchSelectedAsset, semanticsLabel: 'Search pixel');
final Widget addAssetWidget =
    SvgPicture.asset(addAsset, semanticsLabel: 'Add pixel');
final Widget addSelectedAssetWidget =
    SvgPicture.asset(addSelectedAsset, semanticsLabel: 'Add pixel');
final Widget gridAssetWidget =
    SvgPicture.asset(gridAsset, semanticsLabel: 'Grid pixel');
final Widget gridSelectedAssetWidget =
    SvgPicture.asset(gridSelectedAsset, semanticsLabel: 'Grid pixel');
final Widget profileAssetWidget =
    SvgPicture.asset(profileAsset, semanticsLabel: 'Profile');
final Widget profileSelectedAssetWidget =
    SvgPicture.asset(profileSelectedAsset, semanticsLabel: 'Profile');

class BottomNavigate extends StatelessWidget {
  final int currentIndex;
  final Function onTap;

  BottomNavigate({@required this.currentIndex, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return M.BottomNavigationBar(
      type: M.BottomNavigationBarType.fixed,
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: homeAssetWidget,
            activeIcon: homeSelectedAssetWidget,
            title: Text('')),
        BottomNavigationBarItem(
            icon: searchAssetWidget,
            activeIcon: searchSelectedAssetWidget,
            title: Text('')),
        BottomNavigationBarItem(
            icon: addAssetWidget,
            activeIcon: addSelectedAssetWidget,
            title: Text('')),
        BottomNavigationBarItem(
            icon: gridAssetWidget,
            activeIcon: gridSelectedAssetWidget,
            title: Text('')),
        BottomNavigationBarItem(
            icon: profileAssetWidget,
            activeIcon: profileSelectedAssetWidget,
            title: Text('')),
      ],
    );
  }
}
