import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_app/core/extentions/extensions.dart';
import 'package:real_estate_app/core/utils/constants.dart';
import 'package:real_estate_app/features/splash/presentation/bloc/splash_bloc.dart';

import '../../../buildings/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const InitializeApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          } else if (state is SplashError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //sopimem logo
              SvgPicture.asset(AppImages.logo),
              SizedBox(height: context.height * 0.05),
              CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
