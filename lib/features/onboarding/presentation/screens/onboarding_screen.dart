import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late final List<_OnboardingPage> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _OnboardingPage(
        title: "18 ans d'excellence",
        description:
            "Avec notre équipe professionnelle et nos partenaires, nous réalisons des projets à l'architecture moderne qui dépassent vos attentes.",
        assetPath: AppImages.onboarding1,
      ),
      _OnboardingPage(
        title: "Référence en Algérie",
        description:
            "Grâce à notre expertise et notre sérieux, SOPIMEM est aujourd'hui une entreprise privilégiée et reconnue sur tout le territoire.",
        assetPath: AppImages.onboarding3,
      ),
      _OnboardingPage(
        title: "Confiance & Qualité",
        description:
            "Depuis 18 ans, nous tissons la confiance nœud par nœud pour garantir la satisfaction de nos clients au plus haut niveau.",
        assetPath: AppImages.onboarding2,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.read<OnboardingBloc>().add(CompleteOnboarding());
    }
  }

  void _onSkip() {
    context.read<OnboardingBloc>().add(CompleteOnboarding());
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).colorScheme.onPrimary;
    final Color indicatorActiveColor = Theme.of(context).colorScheme.onPrimary;
    final Color indicatorInactiveColor =
        Theme.of(context).colorScheme.onPrimary.withOpacity(0.6);

    final TextTheme textTheme = Theme.of(context).textTheme;

    final Size size = MediaQuery.of(context).size;
    final double containerHeight = size.height * 0.4;

    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingComplete) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Image.asset(
                    page.assetPath,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: containerHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                        child: Builder(
                          builder: (_) {
                            final page = _pages[_currentIndex];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  page.title,
                                  style: textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  page.description,
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: textColor,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: _onSkip,
                            child: Text(
                              'Skip',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              _pages.length,
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: _currentIndex == index ? 12 : 8,
                                height: _currentIndex == index ? 12 : 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? indicatorActiveColor
                                      : indicatorInactiveColor,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _onNext,
                            child: Text(
                              _currentIndex == _pages.length - 1
                                  ? 'Done'
                                  : 'Next',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage {
  final String title;
  final String description;
  final String assetPath;

  _OnboardingPage({
    required this.title,
    required this.description,
    required this.assetPath,
  });
}
