import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/core/extentions/extensions.dart';
import 'package:real_estate_app/features/buildings/presentation/bloc/building_bloc.dart';
import 'package:redacted/redacted.dart';

import '../bloc/building_event.dart';

Widget buildEmptyState(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.width * 0.05),
      child: Column(
        children: [
          Icon(
            Icons.apartment,
            size: 64,
            color: Colors.grey[400],
          ),
          SizedBox(height: context.height * 0.02),
          Text(
            'Aucune promotion disponible',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: context.height * 0.01),
          Text(
            'Les promotions seront bientôt disponibles',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

Widget buildErrorWidget(BuildContext context, String message) {
    return Container(
      padding: EdgeInsets.all(context.width * 0.05),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[300],
          ),
          SizedBox(height: context.height * 0.02),
          Text(
            'Une erreur s\'est produite',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
          ),
          SizedBox(height: context.height * 0.01),
          Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.height * 0.02),
          ElevatedButton(
            onPressed: () {
              context.read<BuildingBloc>().add(GetAllBuildingsEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.primaryColor,
            ),
            child: Text(
              'Réessayer',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSkeletonCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.height * 0.2,
              width: double.infinity,
              color: Colors.grey[200],
            ),
            Padding(
              padding: EdgeInsets.all(context.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: context.width * 0.6,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: context.height * 0.01),
                  Container(
                    height: 16,
                    width: context.width * 0.4,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: context.height * 0.01),
                  Container(
                    height: 14,
                    width: context.width * 0.8,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: context.height * 0.005),
                  Container(
                    height: 14,
                    width: context.width * 0.6,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: context.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 16,
                        width: context.width * 0.25,
                        color: Colors.grey[200],
                      ),
                      Container(
                        height: 32,
                        width: context.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
          animationDuration: const Duration(milliseconds: 800),
        ),
      ),
    );
  }
  Widget buildSkeletonList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3, // Show 3 skeleton items
      itemBuilder: (context, index) {
        return buildSkeletonCard(context);
      },
    );
  }

  Widget buildBuildingCard(BuildContext context, dynamic building) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Building Image - FIXED: Use 'image' instead of 'imageUrl'
            Container(
              height: context.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: building.image != null && building.image.isNotEmpty
                  ? Image.network(
                      building.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.apartment,
                            size: 50,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                    )
                  : Icon(
                      Icons.apartment,
                      size: 50,
                      color: Colors.grey[400],
                    ),
            ),
            // Building Details
            Padding(
              padding: EdgeInsets.all(context.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    building.name ?? 'Nom non disponible',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.height * 0.005),
                  if (building.location != null)
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: context.width * 0.01),
                        Expanded(
                          child: Text(
                            building.location,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: context.height * 0.01),
                  if (building.description != null)
                    Text(
                      building.description,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  SizedBox(height: context.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (building.price != null)
                        Text(
                          '${building.price} DA',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to building details
                          context.read<BuildingBloc>().add(
                                GetBuildingDetailsEvent(building.id),
                              );
                          Navigator.pushNamed(
                            context,
                            '/building-details',
                            arguments: building.id,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Voir détails',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBuildingsList(BuildContext context, List<dynamic> buildings) {
    if (buildings.isEmpty) {
      return buildEmptyState(context);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buildings.length,
      itemBuilder: (context, index) {
        final building = buildings[index];
        return buildBuildingCard(context, building);
      },
    );
  }
  Widget buildActionCard(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.25,
        height: context.width * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: context.theme.primaryColor,
              size: 30,
            ),
            SizedBox(height: context.height * 0.01),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }