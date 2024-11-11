import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoppy/app/data/images/Item.dart';
import 'package:shoppy/app/modules/home/views/favorites_view.dart';
import 'package:shoppy/app/modules/home/views/main_view.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs; // Current selected index
  RxList<Item> items = RxList<Item>([]); //list of current items
  final box = GetStorage();

  // List of pages to display for each tab
  final List<Widget> pages = [
    const MainView(),
    const FavoritesView(),
    const Center(child: Text('User Profile')),
    const Center(child: Text('App Settings')),
  ];

  void storageInfo() {
    print('Stored items: ${box.read('items')}');
    //print('Item Check: ');
  }

  void loadFavs() {
    //loading nodes in the shape of List<Dynamic> to load it correctly
    List<dynamic> storedNotes = box.read('items') ?? [];
    List<Item> noteList =
        storedNotes.map((noteMap) => Item.fromMap(noteMap)).toList();
    items.assignAll(
        noteList); // Assign the deserialized items to the reactive list
  }

  void saveFavs(List<Item> items) {
    // convert each note to a Map<String, dynamic> for proper storage locally
    List<Map<String, dynamic>> noteList =
        items.map((note) => note.toMap()).toList();
    box.write('items',
        noteList); // saving the list of maps to GetStorage (local storage)
  }

  void addItem(Item item) {
    if (!items.contains(item)) {
      items.add(item);
      saveFavs(items); //updating the items in local memory
    }
  }

  void removeItem(Item item) {
    if (items.contains(item)) {
      items.remove(item);
      saveFavs(items); //updating the items in local memory
    }
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    //print(selectedIndex);
  }

  String snackbarMessage(item) {
    loadFavs();
    if (!items.contains(item)) {
      return 'Item added to favorites';
    } else {
      return 'Item is already in favorites.';
    }
  }

  @override
  void onInit() {
    storageInfo();
    loadFavs();
    selectedIndex = 0.obs;
    super.onInit();
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
