import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoppy/app/modules/home/controllers/home_controller.dart';
import 'package:shoppy/app/modules/home/views/home_view.dart';
import 'package:shoppy/app/modules/login/controllers/login_controller.dart';
import 'package:shoppy/app/modules/login/views/login_view.dart';
import 'package:shoppy/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:shoppy/app/modules/onboard/views/onboard_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  Get.put(OnboardController());
  Get.put(LoginController());
  Get.put(HomeController());

  var isBoarded = Get.find<OnboardController>().isonboarded;
  var isLoggedin = Get.find<LoginController>().isloggedin;

  inital() {
    print('is Logged in:$isLoggedin');
    print('is onboarded: $isBoarded');

    if (isBoarded == true && isLoggedin == false) {
      return LoginView();
    }

    if (isLoggedin) {
      return HomeView();
    }

    return OnboardView();
  }

  runApp(
    GetMaterialApp(
      home: inital(),
      title: "Shoppy",
      //initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
