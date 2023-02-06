import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(onPressed: () async {
              //   var status = await Permission.camera.status;
              //   if(status.isDenied)
              //     {
              //       Permission.camera.request();
              //     }
              // }, child: Text("Camera Permission")),
              // SizedBox(height: Get.height/21,),
              // ElevatedButton(onPressed: () async {
              //   var status = await Permission.storage.status;
              //   if(status.isDenied)
              //   {
              //     Permission.storage.request();
              //   }
              // }, child: Text("Storage Permission")),
              // SizedBox(height: Get.height/21,),
              ElevatedButton(onPressed: () async {
                var status = await Permission.location.status;
                if(status.isDenied)
                {
                  Permission.location.request();
                }
              }, child: Text("Location Permission")),

            ],
          )
        ),
      ),
    );
  }
}
