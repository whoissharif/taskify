import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/onboarding/controllers/onboarding_controller.dart';
import 'features/onboarding/views/onboarding_screen.dart';
import 'features/todo/controllers/todo_controller.dart';
import 'features/todo/views/home_screen.dart';
import 'utils/app_strings.dart';
import 'utils/app_colors.dart';

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
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.primary,
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: isviewed != 0 ? const OnboardingScreen() : const HomeScreen(),
      ),
    );
  }
}
