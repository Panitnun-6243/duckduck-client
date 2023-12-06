import 'package:dio/dio.dart';
import 'package:duckduck/controller/http_handler.dart';
import 'package:duckduck/controller/mqtt_handler.dart';
import 'package:duckduck/models/light.dart';
import 'package:duckduck/pages/pages.dart';
import 'package:duckduck/providers/authentication_provider.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/providers/sleep_provider.dart';
import 'package:duckduck/widgets/alarm/AlarmMusicSelector.dart';
import 'package:duckduck/pages/sleep/sleep_clinic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await SharedPreferences.getInstance();
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
        ChangeNotifierProvider(create: (context) => SleepProvider()),
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

  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
    () async {
      await Future.delayed(Duration.zero);
      context
          .read<AuthenticationProvider>()
          .login("nongtanny@gmail.com", "123456789");
    }();
  }

  Future<Light> fetchLight(token) async {
    print("fetching");
    Response response = await Caller.dio.get('/light-control',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          receiveTimeout: const Duration(seconds: 5),
        ));
    Light newStatus = Light.fromJson(response.data["data"]);
    return newStatus;
  }

  void putLight(token, Light light, LightMode? mode) async {
    print("putLight ${light.brightness}");
    print("putLight ${light.rgbColor}");
    print("putLight ${light.temperature}");
    print("putLight $mode");
    if (mode == null) {
      if (light.brightness == null) return;
      if (light.mode == LightMode.rgb) {
        print("case 1");
        HSLColor hslColor = HSLColor.fromColor(light.rgbColor!);
        await Caller.dio.patch('/hsl-light/${light.id!}',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token'
              },
            ),
            data: {
              'hsl_color': {
                'h': (hslColor.hue / 2).floor(),
                's': (hslColor.saturation * 100).floor(),
                'l': light.brightness!.toInt()
              },
            });
      } else if (light.mode == LightMode.temperature) {
        print("case 2");
        await Caller.dio.patch('/cct-light/${light.id!}',
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $token'
              },
            ),
            data: {
              'temp': light.temperature,
              'brightness': double.parse(light.brightness!.toStringAsFixed(2))
            });
      }
    } else if (mode == LightMode.rgb) {
      print("case 3");
      HSLColor hslColor = HSLColor.fromColor(light.rgbColor!);
      await Caller.dio.patch('/hsl-light/${light.id!}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
          ),
          data: {
            'hsl_color': {
              'h': (hslColor.hue / 2).floor(),
              's': (hslColor.saturation * 100).floor(),
              'l': (hslColor.lightness * 100).floor()
            },
            // 'brightness': double.parse(light.brightness!.toStringAsFixed(2)),
            // 'color_mode': 'hsl'
          });
    } else if (mode == LightMode.temperature) {
      print("case 4");
      print(light.id);
      print(light.temperature);
      print(light.brightness);
      final data = {
        'temp': light.temperature,
        'brightness': double.parse(light.brightness!.toStringAsFixed(2))
      };
      print(data);
      await Caller.dio.patch('/cct-light/${light.id!}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
          ),
          data: data);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthenticationProvider>();
    final lightProvider = context.watch<LightProvider>();
    final user = authProvider.currentUser;
    final initialRoute = user == null ? '/alarm' : '/home';

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
        '/lullaby-song': (context) => const LullabySongPage(),
        '/light-control': (context) => LightControlPage(
            lightProvider: lightProvider,
            fetchLight: () => fetchLight(authProvider.token),
            putLight: (Light l, LightMode? m) =>
                putLight(authProvider.token, l, m)),
        '/alarm': (context) => const AlarmPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/lullaby-instrument': (context) => const LullabyInstrumentPage(),
        '/lullaby-ambient': (context) => const LullabyAmbientPage(),
        '/lullaby-custom': (context) => const LullabyCustomPage(),
        '/lullaby-natural': (context) => const LullabyNaturalPage(),
      },
    );
  }
}
