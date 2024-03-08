import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies_app/presentation/intro_screen.dart';
import 'package:sizer/sizer.dart';

class MovieAPP extends StatefulWidget {
  const MovieAPP({super.key});

  @override
  State<MovieAPP> createState() => _MovieAPPState();
}

class _MovieAPPState extends State<MovieAPP> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return const GetMaterialApp(
          home: IntroScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
