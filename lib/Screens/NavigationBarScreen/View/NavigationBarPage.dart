import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locator/Screens/HomeScreen/Controller/HomeController.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
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
        backgroundColor: Colors.white,
        body: Obx(() => homeController.Screens[homeController.index.value]),
        bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
            onTap: (value) {
              homeController.index.value = value;
            },
            selectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            currentIndex: homeController.index.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.location_searching),label: "Location Searching"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Permission's"),
            ],
          ),
        ),
      ),
    );
  }
}
