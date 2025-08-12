import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoteshinapp/2_application/pages/signup_page.dart';

import 'login_page.dart';

class Onboarding01Widget extends StatefulWidget {
  const Onboarding01Widget({super.key});

  @override
  State<Onboarding01Widget> createState() => _Onboarding01WidgetState();
}

class _Onboarding01WidgetState extends State<Onboarding01Widget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // Define colors (or use Theme.of(context))
    final primaryColor = const Color(0xFFFDE8E8); // primary
    final errorColor = const Color(0xFFFEC98F);  // error
    final tertiaryColor = const Color(0xFF39D2C0); // tertiary
    final secondaryBg = const Color(0xFFF5F5F5);
    final primaryText = Colors.black;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: secondaryBg,
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0x62E7BCBC),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Gradient Header with Logo & Text
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, errorColor, tertiaryColor],
                      stops: [0, 0.5, 1],
                      begin: AlignmentDirectional(-1, -1),
                      end: AlignmentDirectional(1, 1),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Top gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              secondaryBg.withOpacity(0.3),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      // Content
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0x27FF0E12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Logo
                            Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Color(0xD4FFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(
                                  'assets/images/Hs.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,

                                ),
                              ),
                            ).animate().fade(duration: 400.ms).scale(
                              begin: Offset(3.0, 3.0),
                              end: Offset(1.0, 1.0),
                              curve: Curves.easeInOut,
                            ).then().scale(
                              delay: 300.ms,
                              begin: Offset(0.6, 0.6),
                              end: Offset(1.0, 1.0),
                              curve: Curves.bounceOut,
                            ),

                            // Welcome Text
                            Padding(
                              padding: const EdgeInsets.only(top: 44),
                              child: Text(
                                'Welcome!',
                                style: GoogleFonts.interTight(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: primaryText,
                                ),
                              ).animate().fade(duration: 400.ms).move(
                                begin: const Offset(0, 30),
                                end: Offset.zero,
                                delay: 350.ms,
                              ),
                            ),

                            // Description
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 44,
                                vertical: 8,
                              ),
                              child: Text(
                                'Thanks for joining! Access or create your account below, and get started on your journey!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: primaryText.withOpacity(0.9),
                                ),
                              ).animate().fade(duration: 400.ms).move(
                                begin: const Offset(0, 30),
                                end: Offset.zero,
                                delay: 400.ms,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().fade(duration: 400.ms).scale(
                  begin: Offset(3.0, 3.0),
                  end: Offset(1.0, 1.0),
                  curve: Curves.easeInOut,
                ),
              ),

              // Button Row
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Outlined Button
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginForm()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(
                              color: Color(0xFF7C75DE),
                              width: 2,
                            ),
                            foregroundColor: secondaryBg,
                            elevation: 0,
                            backgroundColor:  primaryColor,
                            fixedSize: const Size(230, 52),
                          ),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ).animate().fade(duration: 300.ms).scale(
                          begin: Offset(0.6, 0.6),
                          end: Offset(1.0, 1.0),
                          curve: Curves.bounceOut,
                          delay: 300.ms,
                        ),
                      ),
                    ),

                    // Filled Button
                    // Filled Button (Sign Up)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor,
                            elevation: 3,
                            fixedSize: const Size(230, 52),
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.interTight(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ).animate().fade(duration: 600.ms).scale(
                  begin: Offset(0.6, 0.6),
                  end: Offset(1.0, 1.0),
                  curve: Curves.bounceOut,
                  delay: 300.ms,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}