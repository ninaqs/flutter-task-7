import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoppy/app/data/images/Item.dart';

import '../modules/home/controllers/home_controller.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  Item item;

  String content = '';
  ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            color: Colors.grey.withOpacity(0.3)), // Light border color
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              //borderRadius: BorderRadius.all(Radius.circular(4)),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8), // Set the corner radius here
                child: Image.asset('lib/app/data/images/quality.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Border color
                      borderRadius: BorderRadius.circular(4), // Rounded corners
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${item.price}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          ' S.P',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.blueGrey.shade800,
                  ),
                  IconButton(
                    onPressed: () {
                      HomeController controller = Get.find<HomeController>();
                      content = controller.snackbarMessage(item);
                      controller.addItem(item);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(content)));
                    },
                    icon: const Icon(Icons.favorite_rounded),
                    color: Color.fromARGB(255, 114, 0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FavItemCard extends StatelessWidget {
  Item item;
  FavItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset('lib/app/data/images/quality.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart)),
                    IconButton(
                        onPressed: () {
                          Get.find<HomeController>().removeItem(item);
                        },
                        icon: const Icon(Icons.remove)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
