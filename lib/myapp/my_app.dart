import 'package:anime_alive/core/routes/app_router.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Anime App',
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.home,
          home: MainScreen(),
        );
      },
    );
  }
}
