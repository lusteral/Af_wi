import 'package:flutter/material.dart';
import 'package:af_wi/view/Splash.dart';
import 'package:af_wi/view/AuthScreen.dart';
import 'package:af_wi/view/StudentLogin.dart';
import 'package:af_wi/view/RegistrationInfo.dart';
import 'package:af_wi/view/RemoteStudentStep1.dart';
import 'package:af_wi/view/RemoteStudentStep2.dart';
import 'package:af_wi/view/RequestStatus.dart';
import 'package:af_wi/view/HomeScreen.dart';
import 'package:af_wi/view/LessonDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AFWI App',
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // جعل كل واجهات التطبيق ومكوناته من اليمين إلى اليسار (RTL) بشكل أساسي وشامل
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/student-login': (context) => const StudentLoginScreen(),
        '/registration-info': (context) => const RegistrationInfoScreen(),
        '/remote-step1': (context) => const RemoteStudentStep1Screen(),
        '/remote-step2': (context) => const RemoteStudentStep2Screen(),
        '/request-status': (context) => const RequestStatusScreen(),
        '/home': (context) => const HomeScreen(),
        '/lesson-details': (context) => const LessonDetailsScreen(),
      },
    );
  }
}
