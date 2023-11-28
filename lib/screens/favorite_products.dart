
import 'package:flutter/cupertino.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({super.key});

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Favorites"),);
  }
}
