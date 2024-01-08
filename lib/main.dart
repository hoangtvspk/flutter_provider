import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../app_base/config/app_routes.dart';
import '../app_base/constants/home_widget_constants.dart';
import '../app_base/utils/app_utils.dart';
import 'app_base/config/app_config.dart';
import 'common/providers/theme_provider.dart';
import 'features/home_screen/screens/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSize.designSize,
      child: AppView(),
      builder: (context, child) => child!,
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

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

  Future<void> _initWidgetData() async {
    // var value = await AppService().loadWidgetData();
    // await HomeWidget.saveWidgetData<String>(
    //     HomeWidgetKeyConstant.getData, jsonEncode(value.data));
    // await HomeWidget.updateWidget(
    //   name: HomeWidgetConstant.androidSmallWidgetProvider,
    //   androidName: HomeWidgetConstant.androidSmallWidgetProvider,
    //   iOSName: HomeWidgetConstant.iosWidgetName,
    // );
    // await HomeWidget.updateWidget(
    //     name: HomeWidgetConstant.androidLargeWidgetProvider,
    //     androidName: HomeWidgetConstant.androidLargeWidgetProvider,
    //     iOSName: HomeWidgetConstant.iosWidgetName);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
        //Your other providers goes here...
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
    // MaterialApp(
    //   scrollBehavior: const ScrollBehaviorModified(),
    //   navigatorKey: navigatorKey,
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: AppRoutesMain.initial,
    //   onGenerateRoute: AppRoutesMain.onGenerateRoute,
    //   themeMode: ThemeMode.light,
    //   theme: AppTheme.light,
    //   darkTheme: AppTheme.dark,
    //   home: const HomeScreen(),

    //   // builder: (builderContext, child) {
    //   //   return MediaQuery(
    //   //     data: MediaQuery.of(builderContext)
    //   //         .copyWith(textScaleFactor: 1.0, boldText: false),
    //   //     child: BlocListener<AuthenticationBloc, AuthenticationState>(
    //   //       listenWhen: ((previous, current) {
    //   //         return previous.authStatus != current.authStatus;
    //   //       }),
    //   //       listener: (context, state) {
    //   //         _initWidgetData();
    //   //         _navigator.pushNamedAndRemoveUntil(
    //   //             AppRoutesMain.dashBoard, (route) => false);
    //   //       },
    //   //       child: child,
    //   //     ),
    //   //   );
    //   // }
    // );
  }
}
