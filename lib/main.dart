import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_projem/home.dart';
import 'package:flutter_projem/screen/coctails-detail/cocktail_detail_screen.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String title = 'Cocktails';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: title,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/detail_screen',
        builder: (BuildContext context, GoRouterState state) {
          final id = state.extra as String;
          return CocktailDetailScreen(id: id);
        },
      ),
    ],
  );
}

class ScreenArguments {
  const ScreenArguments({this.id});
  final String? id;
}
