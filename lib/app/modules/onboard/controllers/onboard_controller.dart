import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardController extends GetxController {
  PageController pageController = PageController();
  final storage = GetStorage();
  late bool isonboarded;      //a flag to save weither use swiped through onboarding pages

  @override
  void onInit() {
    super.onInit();
    isonboarded = storage.read('isboarded') ?? false;
    //print(storage.read('isboarded'));
    //print(isonboarded);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
