import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/screens/auth/signup_screen.dart';
import 'package:wp_commerce_1/modules/screens/auth/login_screen.dart';

class BaseAuth extends StatelessWidget {
  const BaseAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('brand'.tr),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'login'.tr,
              ),
              Tab(text: 'signup'.tr),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginScreen(),
            SignupScreen(),
          ],
        ),
      ),
    );
  }
}
