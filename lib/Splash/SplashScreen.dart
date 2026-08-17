import 'package:flutter/material.dart';
import '../Widget/DiagonalBackgroundPainter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalBackgroundPainter(),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                   Spacer(flex: 3),

                  Image.asset("assets/images/splash.png"),
                   SizedBox(height: 10),

                  Text(
                    'Spendly',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2563EB),
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    'Know where your money goes.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Spacer(flex: 3),

                  Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color:  Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 24,
                      decoration: BoxDecoration(
                        color:  Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                 SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

