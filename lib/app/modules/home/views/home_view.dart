import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        //interactive scaffold depending on selected page
        appBar: AppBar(
          title: const Text('SHOPPY'),
          backgroundColor: Colors.blueGrey.shade500,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          //starts at home page and navigates between 4 pages
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey.shade100,
          selectedItemColor: Colors.red.shade800,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: controller.onItemTapped,
          currentIndex: controller.selectedIndex.value,
        )));
  }
}
