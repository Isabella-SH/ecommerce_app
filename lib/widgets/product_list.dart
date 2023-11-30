import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/repositories/products_favorites_repository.dart';
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

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), //crea 2 columnas
      itemCount: widget.products.length,
      itemBuilder: (context,index){
        return ProductItem(product: widget.products[index]); //recibe cada indice de la lista
      }
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  //parametro
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {

  //atributos
  bool _favorite=false;
  ProductFavoritesRepository? _productFavoritesRepository;


  initialize()async{
    //_favorite toma el valor que da el metodo del repositorie al pasarle cada entidad
    _favorite=await _productFavoritesRepository?.isFavorite(widget.product)??false;
    if (mounted){ //si ya se cargo toda la informacion
      setState(() {
        _favorite=_favorite;
      });
    }
  }

  @override
  void initState(){
    _productFavoritesRepository=ProductFavoritesRepository();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final my_image=Image.network(widget.product.images[0]);
    final my_con= _favorite? const Icon(
      Icons.favorite,color:Colors.red,
    ):const Icon(
      Icons.favorite,color:Colors.grey,
    );

    return Column(
      children: [
        SizedBox(
          height: 110,
          child: Stack(
            children: [
              my_image, //del arreglo de images escoge la pos 0
              Positioned(
                top:0,
                right: 0,
                child: IconButton(
                  onPressed: (){
                    //_favorite cambia
                    setState(() {
                      _favorite=!_favorite;
                    });
                    //se agrega o elimina del repository
                    //si es true lo insert, sino lo elimina
                    _favorite?_productFavoritesRepository?.insert(widget.product):_productFavoritesRepository?.delete(widget.product);
                  },
                  icon:my_con
                )
              ),
            ]
          )
        ),
        Text(widget.product.name??'')
      ],
    );
  }
}



