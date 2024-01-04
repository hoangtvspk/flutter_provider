import 'package:flutter/widgets.dart';
import 'package:flutter_provider/features/home_screen/home_screen.dart';
import '../utils/app_utils.dart';

class AppRoutesMain {
  static String get initial => home;

  static const String splash = "/splash";
  static const String home = "/home";
  static const String setting = "/setting";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return RouteUtilsTemp.createPage(child: const HomeScreen());

      default:
        return RouteUtilsTemp.errorRoute();
    }
  }
}
