import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locator/Screens/HomeScreen/View/HomePage.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
      },
    )
  );
}