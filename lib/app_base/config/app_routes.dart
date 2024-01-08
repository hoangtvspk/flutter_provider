import 'package:flutter/widgets.dart';
import 'package:flutter_provider/features/app_setting/app_setting.dart';
import '../../features/home_screen/screens/home_screen.dart';
import '../utils/app_utils.dart';

class AppRoutesMain {
  static String get initial => home;

  static const String splash = "/splash";
  static const String home = "/home";
  static const String setting = "/setting";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return RouteUtilsTemp.createPage(child: HomeScreen());
      case setting:
        return RouteUtilsTemp.createPage(child: const AppSetting());

      default:
        return RouteUtilsTemp.errorRoute();
    }
  }
}
