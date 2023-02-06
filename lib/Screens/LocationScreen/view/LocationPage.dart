import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:locator/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    homeController.CheckPermission();
    Get.put(HomeController()).GetCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Your Current Location",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        // body: Center(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         ElevatedButton(
        //             style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        //             onPressed: () async {
        //               var status = await Permission.location.status;
        //               if(status.isDenied)
        //               {
        //                 Permission.location.request();
        //               }
        //             },
        //             child: Text("Location Permission",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
        //         ),
        //         SizedBox(height: Get.height/40,),
        //         ElevatedButton(
        //           style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        //           onPressed: () async {
        //             homeController.position.value = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        //           },
        //           child: Text("Get Location Lat & Lag",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //         ),
        //         SizedBox(height: Get.height/40,),
        //         Obx(() =>Text(
        //           "Latitude : ${homeController.position.value.latitude}\nLongitude : ${homeController.position.value.longitude}",
        //           style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 12.sp
        //           ),
        //         ),),
        //         SizedBox(height: Get.height/40,),
        //         ElevatedButton(
        //           style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        //           onPressed: () async {
        //             homeController.placeList.value = await placemarkFromCoordinates(homeController.position.value.latitude, homeController.position.value.longitude);
        //           },
        //           child: Text("Get Your Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //         ),
        //         SizedBox(height: Get.height/40,),
        //         Obx(() =>Text(
        //           homeController.placeList.value.isEmpty?"Please Follow This Step\nStep 1:\n             Click Location Permission Button\nStep 2:\n             Click Get Location Lat & Lag Button\nStep 3  :\n             Click Get Your Address Button":"${homeController.placeList.value[0].thoroughfare}, ${homeController.placeList.value[0].subLocality}, ${homeController.placeList.value[0].locality}, \n${homeController.placeList.value[0].administrativeArea},${homeController.placeList.value[0].country}, -${homeController.placeList.value[0].postalCode}.",
        //           // "${homeController.placeList.value[0].thoroughfare}, ${homeController.placeList.value[0].street}, ${homeController.placeList.value[0].thoroughfare}",
        //           style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 12.sp
        //           ),
        //         ),),
        //         SizedBox(height: Get.height/40,),
        //         ElevatedButton(
        //           style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        //           onPressed: () async {
        //             if(homeController.position.value.latitude != 0.0 || homeController.position.value.latitude != 0.0)
        //               {
        //                   await launchUrl(Uri.parse("https://www.google.com/maps/search/?api=1&query=${homeController.position.value.latitude},${homeController.position.value.longitude}"));
        //               }
        //             else
        //               {
        //                 Get.snackbar("Google Map Not Opening", "Please Follow Steps",snackPosition: SnackPosition.BOTTOM);
        //               }
        //             //homeController.placeList.value = await placemarkFromCoordinates(homeController.position.value.latitude, homeController.position.value.longitude);
        //           },
        //           child: Text("Go Google Map",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        body: Obx(
            () => GoogleMap(
            onMapCreated: (controller) {
              homeController.completer.value.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: homeController.CurrentLocation.value,
              zoom: 11.0,
              tilt: 0,
              bearing: 0,
            ),
              markers: homeController.Markers(),
              // myLocationButtonEnabled: true,
              myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}