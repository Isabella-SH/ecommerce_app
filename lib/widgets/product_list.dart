import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.products});

  //parametro
  final List products;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: widget.products.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(widget.products[index].name)
        );
      }
    );

  }
}
