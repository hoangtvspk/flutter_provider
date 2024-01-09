import 'package:flutter/widgets.dart';
import 'package:flutter_provider/features/app_setting/app_setting.dart';
import '../../features/home_screen/view/home_screen.dart';
import '../../features/home_screen/viewmodel/post_viewmodel.dart';
import '../utils/app_utils.dart';

class AppRoutesMain {
  static String get initial => home;

  static const String splash = "/splash";
  static const String home = "/home";
  static const String setting = "/setting";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return RouteUtilsTemp.createPageProvider(
            provider: (context) => PostViewModel(), child: HomeScreen());
      case setting:
        return RouteUtilsTemp.createPage(child: AppSetting());

      default:
        return RouteUtilsTemp.errorRoute();
    }
  }
}
