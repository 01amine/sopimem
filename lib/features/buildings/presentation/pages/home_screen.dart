import 'package:animated_text_kit/animated_text_kit.dart';
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
          Expanded(flex: 3, child: Container()),
        ],
      ),
    );
  }
}
