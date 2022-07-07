import 'package:flutter/material.dart';
import 'package:wp_commerce_1/components/molecules/search_widget.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: Search());
        },
        icon: Icon(Icons.search));
  }
}