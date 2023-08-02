import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home.dart';
import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, builder) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inventory',
          theme: AppTheme.theme,
          home: const Home(title: 'Inventory'),
        );
      },
    );
  }
}
