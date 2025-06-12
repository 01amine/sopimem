import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/core/extentions/extensions.dart';
import 'package:real_estate_app/core/utils/constants.dart';
import '../bloc/building_bloc.dart';
import '../bloc/building_event.dart';
import '../bloc/building_state.dart';
import '../widgets/building_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<BuildingBloc>().add(GetAllBuildingsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.width * 0.1),
                  bottomRight: Radius.circular(context.width * 0.1),
                ),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(AppImages.logo,
                      color: Colors.white,
                      width: context.width * 0.3,
                      height: context.width * 0.3),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.width * 0.8,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.white),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText('Bienvenue à Sopimem',
                                    speed: const Duration(milliseconds: 300),
                                    textStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.09),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/filter');
                    },
                    child: Container(
                      padding: EdgeInsets.all(context.width * 0.04),
                      height: context.height * 0.07,
                      width: context.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: context.theme.primaryColor,
                          ),
                          SizedBox(width: context.width * 0.02),
                          Text("Rechercher une apartement",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black87,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: context.height * 0.02),
                  // Action cards row
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildActionCard(
                          context,
                          "Offres",
                          Icons.local_offer,
                          () {
                            // Navigate to offers
                          },
                        ),
                        buildActionCard(
                          context,
                          "Consultant",
                          Icons.person,
                          () {
                            // Navigate to consultant
                          },
                        ),
                        buildActionCard(
                          context,
                          "Tour virtuel",
                          Icons.tour_outlined,
                          () {
                            // Navigate to virtual tour
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.03),
                  // Buildings section
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nos Promotions",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to all buildings
                          },
                          child: Text(
                            "Voir tout",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: context.theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  // BLoC Consumer for buildings
                  BlocConsumer<BuildingBloc, BuildingState>(
                    listener: (context, state) {
                      if (state is BuildingError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Erreur: ${state.message}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is BuildingLoading) {
                        return buildSkeletonList(context);
                      } else if (state is BuildingsLoaded) {
                        return buildBuildingsList(context, state.buildings);
                      } else if (state is BuildingError) {
                        return buildErrorWidget(context, state.message);
                      }
                      return buildEmptyState(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
