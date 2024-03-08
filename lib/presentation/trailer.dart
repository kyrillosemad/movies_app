import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/constants.dart';
import 'package:sizer/sizer.dart';

class Trailer extends StatefulWidget {
  const Trailer({super.key});

  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  var player = Get.arguments["player"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
        title: Text(
          "trailer",
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: player,
        ),
      ),
    );
  }
}
