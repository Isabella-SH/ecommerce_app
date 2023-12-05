import 'package:ecommerce_app/models/retaurant.dart';
import 'package:ecommerce_app/services/restaurant_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {

  //atributos
  List restaurants=[]; //puede ser vacio

  initialize() async{
    //se llena con el metodo del servicio
    restaurants=await RestaurantService()?.getAll()??[];
    setState(() {
      restaurants=restaurants; //el valor se actualiza
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
            itemCount: restaurants?.length ?? 0,
            itemBuilder: ((context, index) {
              final restaurant = restaurants![index];
              return RestaurantItem(restaurant: restaurant);
            }
            )
        )
    );
  }
}

class RestaurantItem extends StatefulWidget {
  const RestaurantItem({super.key, required this.restaurant});

  //parametro
  final Restaurant restaurant;

  @override
  State<RestaurantItem> createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.restaurant.title);
  }
}






