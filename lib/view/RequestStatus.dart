import 'package:flutter/material.dart';
import 'package:af_wi/view/HomeScreen.dart';

class RequestStatusScreen extends StatelessWidget {
  const RequestStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF161A48),
                Color(0xFF1C2258),
                Color(0xFF13173E),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // ── زر الرجوع في أعلى اليسار كما في تصميم فيجما ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                // ── ترويسة باهتة في الخلفية كما في فيجما ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Opacity(
                    opacity: 0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'معهد أفواي...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'حيث يبدأ التميز',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          height: 60,
                          child: Stack(
                            children: [
                              Positioned(top: 20, right: 0, child: _box(14, const Color(0xFF429EBD))),
                              Positioned(top: 5, right: 20, child: _box(28, const Color(0xFF00A896))),
                              Positioned(top: 15, right: 55, child: _box(20, const Color(0xFF429EBD))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── البطاقة المركزية الخاصة بالتأكيد تماماً مثل فيجما 7 ──
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 22.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2558).withOpacity(0.95),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: const Color(0xFF333E85).withOpacity(0.6),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ── أيقونة المستخدم مع علامة الصح ──
                            Stack(
                              children: [
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.85),
                                      width: 2.2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.person_outline_rounded,
                                      size: 38,
                                      color: Colors.white.withOpacity(0.85),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1E2558),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF00A896),
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            // ── النص من فيجما ──
                            const Text(
                              'تم إرسال طلبك بنجاح وسيتم التواصل',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'معك عبر الواتساب في أقرب وقت ممكن.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 13,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ── الزر السفلي المعطل / الهادئ كما في تصميم فيجما بالملي ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF222B68).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.12),
                            width: 1,
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            'إرسال الطلب',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.45),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'سيتم التواصل معك عبر الواتساب لتأكيد معلومات التسجيل !',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.35),
                          fontSize: 11,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _box(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.55), width: 1.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
