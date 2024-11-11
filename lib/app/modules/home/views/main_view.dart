import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoppy/app/data/images/Item.dart';
import 'package:shoppy/app/data/item_card.dart';

class MainView extends GetView {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ItemCard(
            item: Item(
                title: 'Item ${index + 1}', id: index, price: (index + 1) * 1000));
      },
    );
  }
}
