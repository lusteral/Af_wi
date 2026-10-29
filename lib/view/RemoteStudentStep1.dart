import 'package:flutter/material.dart';
import 'package:af_wi/view/RemoteStudentStep2.dart';

class RemoteStudentStep1Screen extends StatefulWidget {
  const RemoteStudentStep1Screen({Key? key}) : super(key: key);

  @override
  State<RemoteStudentStep1Screen> createState() => _RemoteStudentStep1ScreenState();
}

class _RemoteStudentStep1ScreenState extends State<RemoteStudentStep1Screen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'عبدالله محمد محمد الوهاب');
  final TextEditingController _departmentController =
      TextEditingController(text: 'قسم اللغة الإنجليزية');
  final TextEditingController _phoneController =
      TextEditingController(text: '777323311');

  @override
  void dispose() {
    _nameController.dispose();
    _departmentController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
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

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),

                        // ── ترويسة من اليمين إلى اليسار: النصوص باليمين والمربعات باليسار ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 1. النصوص على اليمين
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'معهد أفواي...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'حيث يبدأ التميز',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),

                            // 2. المربعات على اليسار
                            SizedBox(
                              width: 105,
                              height: 65,
                              child: Stack(
                                children: [
                                  Positioned(top: 20, right: 0, child: _box(16, const Color(0xFF429EBD))),
                                  Positioned(top: 2, right: 22, child: _box(32, const Color(0xFF00A896))),
                                  Positioned(top: 34, right: 18, child: _box(13, const Color(0xFF429EBD))),
                                  Positioned(top: 12, right: 62, child: _box(22, const Color(0xFF429EBD))),
                                  Positioned(top: 38, right: 50, child: _box(12, const Color(0xFF0C1A4B))),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 45),

                        // ── حقل 1: الاسم الثلاثي مع اللقب ──
                        const Text(
                          'الاسم الثلاثي مع اللقب',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildField(
                          controller: _nameController,
                          hint: 'عبدالله محمد محمد الوهاب',
                        ),

                        const SizedBox(height: 24),

                        // ── حقل 2: القسم المراد الالتحاق به ──
                        const Text(
                          'القسم المراد الالتحاق به',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildField(
                          controller: _departmentController,
                          hint: 'قسم اللغة الإنجليزية',
                        ),

                        const SizedBox(height: 24),

                        // ── حقل 3: رقم الموبايل ──
                        const Text(
                          'رقم الموبايل',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildField(
                          controller: _phoneController,
                          hint: '777323311',
                          keyboardType: TextInputType.phone,
                        ),

                        const SizedBox(height: 50),

                        // ── زر الخطوة التالية (نفس التدرج النيلي الغني) ──
                        Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF2A3785),
                                Color(0xFF1E286D),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(26),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2A3785).withOpacity(0.35),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RemoteStudentStep2Screen(),
                                ),
                              );
                            },
                            child: const Text(
                              'الخطوة التالية',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212654).withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF333E85).withOpacity(0.7),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.right,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color(0xFF868EB8).withOpacity(0.65),
            fontSize: 13,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
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
