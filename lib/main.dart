import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';
import 'services/connectivity_service.dart';
import 'views/home_screen.dart';
import 'widgets/no_internet.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectivityService()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Consumer<ConnectivityService>(
        builder: (context, connectivityService, child) {
          ConnectivityResult status = connectivityService.connectionStatus;
          if(status == ConnectivityResult.none){
            return const NoInternetWidget();
          }
          return const HomeScreen();
        },
      ),
    );
  }
}
