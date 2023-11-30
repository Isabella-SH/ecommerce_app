
import 'package:ecommerce_app/widgets/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/product_service.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {

  //atributos
  List products=[]; //puede ser vacio

  //crear esto afuera para que no se borreo cada vez que se actualiza la vista
  final searchController=TextEditingController();

  initialize() async{
    //se llena con el metodo del servicio
    products=await ProductService().getAll();
    setState(() {
      products=products; //el valor se actualiza
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }


  void searchProducts(String value) async{
    //asigna a mi variable los productos si se hizo una busqueda, sino salen todos los productos
    products= await ProductService().getByName(value);
    setState(() {
      products=products; //actualizo la variable
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
                            //CREA EL BUSCADOS
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: const TextStyle(color: Colors.white, fontWeight:FontWeight.bold),
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.white54
          ),
          onSubmitted: searchProducts       //FUNCION
        ),
      ),
                            //LLAMA A TODOS LOS PRODUCTOS
      body: ProductList(products:products),
    );
  }
}

