import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskify/features/onboarding/controllers/onboarding_controller.dart';
import 'package:taskify/features/onboarding/views/onboarding_screen.dart';
import 'package:taskify/features/todo/controllers/todo_controller.dart';
import 'package:taskify/features/todo/views/home_screen.dart';
import 'package:taskify/utils/colors.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
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
        home: isviewed != 0 ? const OnboardingScreen() : const HomeScreen(),
      ),
    );
  }
}
