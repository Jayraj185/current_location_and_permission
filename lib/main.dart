import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locator/Screens/HomeScreen/View/HomePage.dart';
import 'package:locator/Screens/LocationScreen/view/LocationPage.dart';
import 'package:locator/Screens/NavigationBarScreen/View/NavigationBarPage.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/' : (context) => NavigationBarPage(),
            'Home' : (context) => HomePage(),
            'Location' : (context) => LocationPage(),
          },
        );
      },
    )
  );
}