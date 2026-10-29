import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.88, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/auth');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFD),
      body: Stack(
        children: [
          // ── العلامة المائية الكبيرة لحرف A من شعار المعهد في الخلفية ──
          Positioned(
            right: -size.width * 0.15,
            top: size.height * 0.18,
            bottom: size.height * 0.18,
            width: size.width * 1.1,
            child: Opacity(
              opacity: 0.06,
              child: CustomPaint(
                painter: _LetterAPainter(),
              ),
            ),
          ),

          // ── مربعات مفرغة وممتلئة في أعلى الشاشة ──
          Positioned(top: 45, right: 30, child: _box(32, const Color(0xFF429EBD))),
          Positioned(top: 75, right: 75, child: _box(24, const Color(0xFF0C1A4B))),
          Positioned(top: 60, right: 115, child: _box(28, const Color(0xFF429EBD))),
          Positioned(top: 105, right: 40, child: _box(18, const Color(0xFF00A896), outlined: false)),
          Positioned(top: 115, right: 85, child: _box(20, const Color(0xFF0C1A4B))),
          Positioned(top: 135, right: 125, child: _box(15, const Color(0xFF429EBD))),
          Positioned(top: 155, right: 70, child: _box(12, const Color(0xFF0C1A4B), outlined: false)),
          Positioned(top: 95, left: 45, child: _box(26, const Color(0xFF0C1A4B))),
          Positioned(top: 135, left: 75, child: _box(18, const Color(0xFF429EBD))),

          // ── مربعات مفرغة وممتلئة في أسفل الشاشة ──
          Positioned(bottom: 120, left: 30, child: _box(28, const Color(0xFF429EBD))),
          Positioned(bottom: 85, left: 70, child: _box(22, const Color(0xFF0C1A4B))),
          Positioned(bottom: 60, left: 35, child: _box(16, const Color(0xFF00A896), outlined: false)),
          Positioned(bottom: 45, left: 85, child: _box(20, const Color(0xFF0C1A4B))),
          Positioned(bottom: 65, left: 125, child: _box(24, const Color(0xFF429EBD))),
          Positioned(bottom: 100, left: 110, child: _box(14, const Color(0xFF0C1A4B), outlined: false)),

          // ── الشعار والعبارة الرئيسية بمنتصف الشاشة ──
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image.asset(
                      'image/logo.png',
                      width: size.width * 0.72,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Where Excellence Begins',
                    style: TextStyle(
                      color: Color(0xFF0C1A4B),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _box(double size, Color color, {bool outlined = true}) {
    if (outlined) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(0.6), width: 1.4),
          borderRadius: BorderRadius.circular(5),
        ),
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withOpacity(0.85),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }
  }
}

class _LetterAPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0C1A4B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.lineTo(size.width * 0.72, size.height * 0.9);
    path.lineTo(size.width * 0.58, size.height * 0.65);
    path.lineTo(size.width * 0.35, size.height * 0.65);
    path.lineTo(size.width * 0.22, size.height * 0.9);
    path.lineTo(size.width * 0.05, size.height * 0.9);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
