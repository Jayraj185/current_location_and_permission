import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locator/Screens/HomeScreen/View/HomePage.dart';
import 'package:locator/Screens/LocationScreen/view/LocationPage.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController
{
  RxInt index = 0.obs;
  RxList Screens = [LocationPage(),HomePage()].obs;
  Rx<Position> position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0).obs;
  RxList<Placemark> placeList = <Placemark>[].obs;
  Rx<LatLng> CurrentLocation = LatLng(21.1702, 72.8311).obs;
  Rx<Completer<GoogleMapController>> completer = Completer<GoogleMapController>().obs;
  Future<Future<PermissionStatus>?> CheckPermission() async
  {
    var status = await Permission.location.status;
    if(status.isDenied)
      {
        return Permission.location.request();
      }
    else
      {
        return null;
      }
    update();
  }
  void GetCurrentLocation() async
  {
    position.value = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("============== > ${position.value.latitude} ${position.value.longitude}");
    CurrentLocation.value = LatLng(position.value.latitude, position.value.longitude);
    update();
  }
  RxSet<Marker> Markers()
  {
    return {
      Marker(
        markerId: MarkerId("Current Position"),
        position: LatLng(position.value.latitude,position.value.longitude),
        infoWindow: InfoWindow(title: "Current Position"),
      )
    }.obs;
  }

}