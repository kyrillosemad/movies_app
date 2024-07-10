import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/view/screens/intro_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MovieAPP());
}

class MovieAPP extends StatefulWidget {
  const MovieAPP({super.key});

  @override
  State<MovieAPP> createState() => _MovieAPPState();
}

class _MovieAPPState extends State<MovieAPP> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return const GetMaterialApp(
          home: IntroScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
