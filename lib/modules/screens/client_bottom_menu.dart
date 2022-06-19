import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/controllers/client_bottom_menu_controller.dart';
import 'package:wp_commerce_1/modules/screens/auth/base_auth.dart';
import 'package:wp_commerce_1/modules/screens/product/list_products_screen.dart';

class ClientBottomMenu extends StatelessWidget {
  ClientBottomMenu({Key? key}) : super(key: key);

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() =>
        MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: SizedBox(
              height: 54,
              child: BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: landingPageController.changeTabIndex,
                currentIndex: landingPageController.tabIndex.value,
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.white.withOpacity(0.5),
                selectedItemColor: Colors.white,
                unselectedLabelStyle: unselectedLabelStyle,
                selectedLabelStyle: selectedLabelStyle,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.home,
                        size: 20.0,
                      ),
                    ),
                    label: 'product-menu'.tr,
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        Icons.person,
                        size: 20.0,
                      ),
                    ),
                    label: 'user-menu'.tr,
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final ClientBottomMenuController bottomMenuController = Get.put(
        ClientBottomMenuController(), permanent: false);

    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          buildBottomNavigationMenu(context, bottomMenuController),
          body: Obx(() =>
              IndexedStack(
                index: bottomMenuController.tabIndex.value,
                children: const [
                  ListProductsScreen(),
                  BaseAuth(),
                ],
              )),
        ));
  }
}
