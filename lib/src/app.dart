import 'package:fakestore_api_shop/src/home/homeview.dart';
import 'package:fakestore_api_shop/src/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBAckgroundColor
      ),
      home:HomeView() ,
    );
  }
}