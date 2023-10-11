import 'package:duckduck/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // temp user value
    const user = null;
    return MaterialApp(
        title: 'DuckDuck',
        debugShowCheckedModeBanner: false,
        initialRoute: user == null ? '/login' : '/home',
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/dashboard': (context) => const DashboardPage(),
          '/calendar': (context) => const CalendarPage(),
          '/live-score': (context) => const LiveScorePage(),
          '/weather': (context) => const WeatherPage(),
          '/traffic': (context) => const TrafficPage(),
          '/time-zone': (context) => const TimeZonePage(),
          '/stock': (context) => const StockPage(),
          '/sleep-analysis': (context) => const SleepAnalysisPage(),
          '/lullaby-song': (context) => const LullabySongPage(),
          '/light-control': (context) => const LightControlPage(),
          '/alarm': (context) => const AlarmPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
        });
  }
}
