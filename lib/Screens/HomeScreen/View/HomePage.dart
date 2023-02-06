import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:locator/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Locator",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),onPressed: () async {
                  var status = await Permission.camera.status;
                  if(status.isDenied)
                  {
                    Permission.camera.request();
                  }
                }, child: Text("Camera Permission",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                SizedBox(height: Get.height/40,),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),onPressed: () async {
                  var status = await Permission.storage.status;
                  if(status.isDenied)
                  {
                    Permission.storage.request();
                  }
                }, child: Text("Storage Permission",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                SizedBox(height: Get.height/40,),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),onPressed: () {
                  openAppSettings();
                }, child: Text("Open Setting Menu",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                SizedBox(height: Get.height/40,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () async {
                      var status = await Permission.location.status;
                      if(status.isDenied)
                      {
                        Permission.location.request();
                      }
                },
                    child: Text("Location Permission",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ),

              ],
            ),
          )
        ),
      ),
    );
  }
}
