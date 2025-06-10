import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/features/common/presentation/theme/app_theme.dart';
import 'package:real_estate_app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:real_estate_app/features/splash/presentation/pages/splash_screen.dart';
import 'package:real_estate_app/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      // routes: {
      //   '/home': (context) => BlocProvider(
      //     create: (_) => di.sl<HomeBloc>(),
      //     child: const HomeScreen(),
      //   ),
      // },
    );
  }
}