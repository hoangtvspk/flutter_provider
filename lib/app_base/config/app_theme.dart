part of 'app_config.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    splashFactory: InkRipple.splashFactory,
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    splashFactory: InkRipple.splashFactory,
    brightness: Brightness.dark,
  );
}
