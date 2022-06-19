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

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      actions: [
      IconButton(
        onPressed: () {
          ShowSearch(
            context: context,
            delegate: CustomSearchDelegate(),);
        },
          icon: const Icon(Icons.Search),
      ),
      ],
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: () => Get.to(() => Other(),
              transition: Transition.upToDown,
              duration: const Duration(milliseconds: 200)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
List<String> searchTerms = [
  'mochila',
  'camiseta',
];

@override
List<widget> buildActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: (){
        query = '';
      },
    ),
  ];
}

@override
widget buildLeading(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      close(context, null);
    },
  );
}

@override
widget buildResults(BuildContext context) {
  list<String> matchQuery = [];
  for (var roupas in searchTerms) {
    if (roupas,toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(roupas);
    }
  }
  return ListView.builder(
    itemCount: matchQuery.length, 
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },
  );
}

@override
widget buildSuggestions(BuildContext context) {
  List<String> matchQuery = [];
  for (var roupas in searchTerms) {
    if (roupas.toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(roupas);
    }
  }
  return ListView.builder(
    itemCount: matchQuery.length,
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },
  );
  
}

}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              Center(child: Text("${c.count}")),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36.0, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Voltar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
