import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppy/app/modules/home/controllers/home_controller.dart';
import 'package:shoppy/app/modules/home/views/home_view.dart';
import 'package:shoppy/app/modules/register/controllers/register_controller.dart';
import 'package:shoppy/app/modules/register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    Get.put(HomeController());

    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey.shade200, Colors.white])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                  key: controller.formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome!',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                        const Text('Have an account? Log in:',
                            style: TextStyle(fontSize: 20)),
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white60,
                                    hintText: 'Username',
                                    border: OutlineInputBorder()))),
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 8) {
                                    return 'Password length should be at least 8';
                                  }
                                  if (!(value.contains(RegExp(r'[A-Za-z]')) &&
                                      value.contains(RegExp(r'[0-9]')))) {
                                    return 'Password should contain letters and digits';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white60,
                                    hintText: 'Password',
                                    border: OutlineInputBorder()))),
                        ElevatedButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                Get.find<LoginController>()
                                    .storage
                                    .write('isLoggedIn', true);
                                print(Get.find<LoginController>()
                                    .storage
                                    .read('isLoggedIn'));
                                Get.to(const HomeView());
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.red.shade800),
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white)),
                            child: const Text('Log in',
                                style: TextStyle(fontSize: 20)))
                      ])),
              Column(children: [
                const Text(
                  "First visit? Join Us",
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(const RegisterView());
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.red.shade800),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white)),
                    child: const Text('Create Account',
                        style: TextStyle(fontSize: 20)))
              ])
            ],
          ),
        ));
  }
}
