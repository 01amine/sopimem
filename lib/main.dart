import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:real_estate_app/features/buildings/presentation/bloc/building_bloc.dart';
import 'package:real_estate_app/features/buildings/presentation/pages/filter_screen.dart';
import 'package:real_estate_app/features/common/presentation/theme/app_theme.dart';
import 'package:real_estate_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:real_estate_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:real_estate_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:real_estate_app/di/injection_container.dart' as di;

import 'features/buildings/presentation/pages/home_screen.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      theme: AppTheme.lightTheme,
      home: BlocProvider(
        create: (_) => di.sl<SplashBloc>(),
        child: const SplashScreen(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => BlocProvider(
              create: (_) => di.sl<OnboardingBloc>(),
              child: const OnboardingScreen(),
            ),
        '/home': (context) => BlocProvider(
              create: (_) => di.sl<BuildingBloc>(),
              child: const HomeScreen(),
            ),
        '/filter': (context) => FilterScreen()
      },
    );
  }
}
