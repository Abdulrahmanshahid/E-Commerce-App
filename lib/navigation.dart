import 'package:ecommerce_app/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'favorite.dart';
import 'home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerNavigationController());

    final controller = Get.find<CustomerNavigationController>();

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class CustomerNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(), FavoriteScreen(), ProfileScreen()];
}
