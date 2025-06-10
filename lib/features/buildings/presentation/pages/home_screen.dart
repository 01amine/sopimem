import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/core/extentions/extensions.dart';
import 'package:real_estate_app/core/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  bottomLeft: Radius.circular(context.width * 0.01),
                  bottomRight: Radius.circular(context.width * 0.01),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: context.height * 0.09),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bienvenu à",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SvgPicture.asset(
                        AppImages.logo,
                        color: Colors.white,
                        width: context.width * 0.25,
                        height: context.width * 0.25,
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.04),
                  GestureDetector(
                    onTap: () {
                      // navigate to filter screen
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
          Expanded(flex: 3, child: Container()),
        ],
      ),
    );
  }
}
