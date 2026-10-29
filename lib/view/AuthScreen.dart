import 'package:flutter/material.dart';
import 'package:af_wi/view/StudentLogin.dart';
import 'package:af_wi/view/RegistrationInfo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            // ── خلفية كاملة بتدرج كحلي داكن ──
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF101642),
                    Color(0xFF161D4C),
                    Color(0xFF12173F),
                  ],
                ),
              ),
            ),

            // ── صورة الطلاب في القاعة ممتدة كخلفية في الجزء الأوسط والسفلي مع تدرج دمجي ──
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              left: 0,
              right: 0,
              bottom: 0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'image/5.jpg',
                    fit: BoxFit.cover,
                  ),
                  // تدرج لدمج أعلى وأسفل الصورة بالخلفية الكحلية تماماً مثل فيجما
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.22, 0.65, 1.0],
                        colors: [
                          const Color(0xFF101642),
                          Colors.transparent,
                          const Color(0xFF12173F).withOpacity(0.55),
                          const Color(0xFF101642).withOpacity(0.95),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── مربعات مفرغة هندسية في الترويسة ──
            Positioned(top: 50, left: 35, child: _box(24, const Color(0xFF429EBD))),
            Positioned(top: 80, left: 20, child: _box(16, const Color(0xFF00A896))),
            Positioned(top: 70, left: 55, child: _box(18, const Color(0xFF429EBD))),
            Positioned(top: 100, left: 40, child: _box(12, const Color(0xFF429EBD))),

            // ── المحتوى الأمامي (النصوص بالأعلى والأزرار بالأسفل) ──
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // ── العنوان الرئيسي ──
                    const Text(
                      'مرحباً بك في معهد أفواي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),

                    // ── النص التوضيحي ──
                    Text(
                      '...اختر كيفية تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const Spacer(),

                    // ── الزر الأول: كحلي داكن بإطار أبيض ناصع ──
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF171E4B).withOpacity(0.88),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1.3,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudentLoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'تسجيل الدخول كطالب حالي في المعهد',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── الزر الثاني: أبيض ناصع بنص كحلي داكن ──
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationInfoScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'تسجيل الدخول كطالب جديد (عن بعد)',
                          style: TextStyle(
                            color: Color(0xFF131B4D),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.5), width: 1.2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
