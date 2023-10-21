import 'package:duckduck/pages/pages.dart';
import 'package:duckduck/providers/authentication_provider.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => LightProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // temp user value
    const user = null;
    return ChangeNotifierProvider(
      create: (context) => LightProvider(),
      child: MaterialApp(
          title: 'DuckDuck',
          debugShowCheckedModeBanner: false,
          initialRoute: user == null ? '/alarm' : '/home',
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
          }),
=======
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final user = authProvider.currentUser;
    final initialRoute = user == null ? '/login' : '/home';

    return MaterialApp(
      title: 'DuckDuck',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
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
      },
>>>>>>> 83374f19815fcfcbf6854ea8d5ba132ab03360f1
    );
  }
}
