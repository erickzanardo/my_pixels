import 'package:flutter/widgets.dart';

// TODO create a way to initialize this class based on theme selection
// (Dark or Light) and provide it to where is needed (DI / ServiceLocator)
class Colors {
  Colors._();

  /// define custom app colors
  static const Color _solidWhite = Color(0xFFFFFFFF);
  static const Color _solidBlack = Color(0xFF000000);
  static const Color _mediumGray = Color(0xFFADADAD);
  static const Color _lightWarmGray = Color(0xFFF8F6F9);
  static const Color _pixelGreen = Color(0xFF83E0BA);


  /// define variables to point to custom colors for specific uses based on
  /// theme selection (Dark or Light)
  ///
  /// ex:
  /// static const Color text = isDarkTheme ? _solidWhite : _solidBlack
  static const Color detailBackground = _solidWhite;

  static const Color placeHolderColor = _pixelGreen;
  static const Color placeHolderTextColor = _solidWhite;

  static const Color commentTextColor = _solidBlack;
  static const Color commentInfoTextColor = _mediumGray;
  static const Color commentFieldColor = _lightWarmGray;
  static const Color commentFieldHintColor = _mediumGray;
}


