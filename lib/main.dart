import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:wp_commerce_1/constants/I18n/Messages.dart';
import 'package:wp_commerce_1/modules/screens/client_bottom_menu.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(document.path);

  runApp(GetMaterialApp(
    home: ClientBottomMenu(),
    translations: Messages(),
    // your translations
    locale: const Locale('pt', 'BR'),
    // translations will be displayed in that locale
    fallbackLocale: const Locale('pt', 'BR'),
  ));

}