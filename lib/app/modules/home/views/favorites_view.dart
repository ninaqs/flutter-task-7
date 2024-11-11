import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoppy/app/data/item_card.dart';
import 'package:shoppy/app/modules/home/controllers/home_controller.dart';

class FavoritesView extends GetView {
  const FavoritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      body: Obx(() {
        //interactive list updating when an item is added or deleted
        return GridView.builder(
          itemCount: Get.find<HomeController>().items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return FavItemCard(item: Get.find<HomeController>().items[index]);
          },
        );
      }),
    );
  }
}
