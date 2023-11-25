import 'package:dio/dio.dart';
import 'package:duckduck/controller/MqttHandler.dart';
import 'package:duckduck/models/light.dart';
import 'package:duckduck/pages/pages.dart';
import 'package:duckduck/providers/authentication_provider.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/widgets/alarm/AlarmMusicSelector.dart';
import 'package:duckduck/widgets/sleep/sleep_clinic.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MqttHandler mqttHandler = MqttHandler();
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
    dio.options.baseUrl = 'https://dduck.panitnun.tech/api/v1';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<Light> fetchLight() async {
    Response response = await dio.get('/light-control',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDM1MzkyNzQsImlhdCI6MTcwMDkxMTI3NCwic3ViIjoiNjU1NjMwZTAxYTA0MmI3ODQxYjUxMmY5In0.tYm0ClS67TuRELDnhGeB8bJivPMDtzNnhR9xTyrw7ag'
        },
      )
    );
    Light newStatus = Light.fromJson(response.data["data"]);
    return newStatus;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final user = authProvider.currentUser;
    final initialRoute = user == null ? '/sleep-clinic' : '/home';

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
        '/sleep-clinic': (context) => const SleepClinicPage(),
        '/sleep-analysis': (context) => const SleepAnalysisPage(),
        '/lullaby-song': (context) => const LullabySongPage(),
        '/light-control': (context) => LightControlPage(lightStatus: mqttHandler.lightStatus, fetchLight: fetchLight),
        '/alarm': (context) => const AlarmPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
