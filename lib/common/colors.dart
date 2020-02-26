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
  static const Color _lightRed = Color(0xFFF45A5D);

  /// define variables to point to custom colors for specific uses based on
  /// theme selection (Dark or Light) (TODO)
  ///
  /// ex:
  /// static Color get text => isDarkTheme ? _solidWhite : _solidBlack
  static Color get detailBackground => _solidWhite;

  static Color get placeHolderColor => _pixelGreen;
  static Color get placeHolderTextColor => _solidWhite;

  static Color get commentTextColor => _solidBlack;
  static Color get commentInfoTextColor => _mediumGray;
  static Color get commentFieldColor => _lightWarmGray;
  static Color get commentFieldHintColor => _mediumGray;

  static Color get pixelListBackgroung => _lightWarmGray;

  // list pixel
  static Color get likeButtonColor => _lightRed;
  static Color get likeButtonColorOpacity1 => _lightRed.withOpacity(0.7);
  static Color get likeButtonColorOpacity2 => _lightRed.withOpacity(0.3);
}
