import 'package:flutter/material.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  bool _isPlaying = false;
  bool _isLiked = false;
  bool _isSaved = false;

  final List<Map<String, dynamic>> _keyPoints = [
    {'id': '1.', 'color': const Color(0xFF1C1A54), 'title': 'مقدمة في القواعد الصوتية والنطق السليم'},
    {'id': '2.', 'color': const Color(0xFF00A896), 'title': 'أهم التراكيب اللغوية المستخدمة يومياً'},
    {'id': '3.', 'color': const Color(0xFF1C1A54), 'title': 'تمارين عملية وتطبيقات على المحادثة المباشرة'},
    {'id': '4.', 'color': const Color(0xFF00A896), 'title': 'المصطلحات الشائعة في بيئة العمل والدراسة'},
    {'id': '5.', 'color': const Color(0xFF1C1A54), 'title': 'مراجعة شاملة لاختبار تحديد المستوى والمقابلة'},
    {'id': '6.', 'color': const Color(0xFF00A896), 'title': 'واجبات وتكليفات للدرس القادم مع المشرف'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 85.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // ── الترويسة العلوية الكحلية الداكنة المتطابقة مع فيجما 11 ──
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF141944),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // اليمين: معلومات الطالب
                            Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF00A896),
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'image/5.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'مرحباً عبدالله',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'طالب متميز - قسم اللغة الإنجليزية',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // اليسار: زر الرجوع
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── مشغل الفيديو (صورة الطلاب 5.jpg + زر Play + شريط أسفل الفيديو) ──
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 195,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                'image/5.jpg',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.3),
                              ),

                              // زر التشغيل Play في المنتصف
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isPlaying = !_isPlaying;
                                    });
                                  },
                                  child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF141944).withOpacity(0.7),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.2,
                                      ),
                                    ),
                                    child: Icon(
                                      _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 34,
                                    ),
                                  ),
                                ),
                              ),

                              // شريط أسفل الفيديو "الكورس 1"
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  color: const Color(0xFF141944).withOpacity(0.85),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'الكورس 1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.remove_red_eye_outlined, color: Colors.white70, size: 14),
                                          SizedBox(width: 4),
                                          Text(
                                            '2,371',
                                            style: TextStyle(color: Colors.white70, fontSize: 11),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.access_time_rounded, color: Colors.white70, size: 14),
                                          SizedBox(width: 4),
                                          Text(
                                            '24:15',
                                            style: TextStyle(color: Colors.white70, fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── بطاقة المدرس والتفاصيل ──
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF00A896), width: 1.5),
                            ),
                            child: ClipOval(
                              child: Image.asset('image/5.jpg', fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'أحمد المحمدي',
                                style: TextStyle(
                                  color: Color(0xFF0C1747),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'مدرس المادة',
                                style: TextStyle(color: Colors.grey, fontSize: 11),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A896).withOpacity(0.12),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Text(
                              'Details',
                              style: TextStyle(
                                color: Color(0xFF00A896),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F1F5)),
                    ),
                    const SizedBox(height: 14),

                    // ── مواضيع الدرس المهمة ──
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'مواضيع الدرس المهمة',
                            style: TextStyle(
                              color: Color(0xFF0C1747),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _bulletItem('المحادثة التفاعلية وفهم السياق الصوتي'),
                          _bulletItem('تطبيق المصطلحات في جمل وعبارات صحيحة'),
                          _bulletItem('حل تدريبات كتاب القواعد مع المدرب'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ── أهم النقاط في الدرس (6 بطاقات متناوبة الألوان كحلي وتركواز) ──
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'أهم النقاط في الدرس',
                            style: TextStyle(
                              color: Color(0xFF00A896),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // الـ 6 بطاقات المتناوبة كما في فيجما 11 بالملي
                          ..._keyPoints.map((point) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 9),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                              decoration: BoxDecoration(
                                color: point['color'] as Color,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: (point['color'] as Color).withOpacity(0.25),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    point['id'] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      point['title'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // ── شريط التفاعل السفلي العائم الكحلي الداكن كما في فيجما 11 ──
              Positioned(
                bottom: 14,
                left: 24,
                right: 24,
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1A54),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLiked ? Icons.thumb_up_rounded : Icons.thumb_up_alt_outlined,
                          color: _isLiked ? const Color(0xFF00A896) : Colors.white70,
                          size: 20,
                        ),
                        onPressed: () => setState(() => _isLiked = !_isLiked),
                      ),
                      IconButton(
                        icon: const Icon(Icons.mode_comment_outlined, color: Colors.white70, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined, color: Colors.white70, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          _isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_outlined,
                          color: _isSaved ? const Color(0xFF00A896) : Colors.white70,
                          size: 20,
                        ),
                        onPressed: () => setState(() => _isSaved = !_isSaved),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF00A896),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF2C3E50),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
