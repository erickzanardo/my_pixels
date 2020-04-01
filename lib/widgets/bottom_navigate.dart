import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter_svg/flutter_svg.dart';

final String homeAsset = 'assets/images/home.svg';
final String searchAsset = 'assets/images/search.svg';
final String addAsset = 'assets/images/add_pixel.svg';
final String gridAsset = 'assets/images/grid.svg';
final String profileAsset = 'assets/images/profile.svg';

final Widget homeAssetWidget =
    SvgPicture.asset(homeAsset, semanticsLabel: 'Home');
final Widget searchAssetWidget =
    SvgPicture.asset(searchAsset, semanticsLabel: 'Search pixel');
final Widget addAssetWidget =
    SvgPicture.asset(addAsset, semanticsLabel: 'Add pixel');
final Widget gridAssetWidget =
    SvgPicture.asset(gridAsset, semanticsLabel: 'Grid pixel');
final Widget profileAssetWidget =
    SvgPicture.asset(profileAsset, semanticsLabel: 'Profile');

class BottomNavigate {
  final int currentIndex;
  Function onTap;

  BottomNavigate({@required this.currentIndex, @required this.onTap});

  M.BottomNavigationBar asMaterial() {
    return M.BottomNavigationBar(
        type: M.BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: homeAssetWidget, title: Text('')),
          BottomNavigationBarItem(icon: searchAssetWidget, title: Text('')),
          BottomNavigationBarItem(icon: addAssetWidget, title: Text('')),
          BottomNavigationBarItem(icon: gridAssetWidget, title: Text('')),
          BottomNavigationBarItem(icon: profileAssetWidget, title: Text('')),
        ]);
  }
}
