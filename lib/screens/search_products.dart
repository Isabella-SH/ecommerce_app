
import 'package:flutter/cupertino.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Shoes"),);
  }
}

