
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/repositories/products_favorites_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({super.key});

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {

  ProductFavoritesRepository? _productFavoritesRepository;
  List<Product>? _products;

  initialize() async{ // "?? []" -> si es nulo, devuelve un arreglo vacio
    _products=await _productFavoritesRepository?.getAll()??[];
    setState((){
      _products=_products;
    });
  }

  @override
  void initState(){
    _productFavoritesRepository=ProductFavoritesRepository();
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: _products?.length?? 0 ,
        itemBuilder: ((context,index){
          return Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(_products?[index].images[0]),
                Text(_products?[index].name??''),                   //VERIFICO NO SEA NULO

              ],
            ),
          )
          );
        })
    );
  }
}
