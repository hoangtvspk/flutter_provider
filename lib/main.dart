import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_base/config/app_routes.dart';
import '../app_base/utils/app_utils.dart';
import 'app_base/config/app_config.dart';
import 'common/providers/theme_provider.dart';
import 'features/home_screen/view/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isDark = pref.getBool("isDark") ?? false;
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSize.designSize,
      child: AppView(isDark: isDark),
      builder: (context, child) => child!,
    );
  }
}

class AppView extends StatefulWidget {
  final bool isDark;
  const AppView({Key? key, required this.isDark}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    super.initState();
    _initWidgetData();
  }

  NavigatorState get _navigator => navigatorKey.currentState!;
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initWidgetData() async {}

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(widget.isDark),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeObject, _) => MaterialApp(
          scrollBehavior: const ScrollBehaviorModified(),
          debugShowCheckedModeBanner: false,
          title: 'Dynamic Theme Demo',
          themeMode: themeObject.mode,
          initialRoute: AppRoutesMain.initial,
          onGenerateRoute: AppRoutesMain.onGenerateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue[600],
            hintColor: Colors.amber[700],
            brightness: Brightness.light,
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue[300],
            hintColor: Colors.amber,
            brightness: Brightness.dark,
            fontFamily: 'Karla',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
