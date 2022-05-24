import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taskify/features/onboarding/controllers/onboarding_controller.dart';
import 'package:taskify/features/onboarding/views/onboarding_screen.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import 'package:taskify/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoController>(
          create: (context) => TodoController(),
        ),
        ChangeNotifierProvider<OnboardingController>(
          create: (context) => OnboardingController(),
        ),
      ],
      child: MaterialApp(
        title: 'Taskify',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: TaskifyColors.primary,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
