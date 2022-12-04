import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/screens/home_page.dart';
import 'package:getx_example/controllers/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: (){
        Get.put(HomeController());
      },
      getPages: HomeController().getPagesList(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
