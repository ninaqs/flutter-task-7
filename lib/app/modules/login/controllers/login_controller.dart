import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final storage = GetStorage();
  late bool isloggedin;           //a flag to save weither user is logged in or not 

  @override
  void onInit() {
    super.onInit();
    isloggedin = storage.read('isLoggedIn') ?? false;  //initially user is not logged in 
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
