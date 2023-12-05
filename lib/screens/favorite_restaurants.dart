
import 'package:ecommerce_app/models/retaurant.dart';
import 'package:ecommerce_app/repositories/restaurant_favorites_repository.dart';
import 'package:ecommerce_app/widgets/restaurant_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteRestaurants extends StatefulWidget {
  const FavoriteRestaurants({super.key});

  @override
  State<FavoriteRestaurants> createState() => _FavoriteRestaurantsState();
}

class _FavoriteRestaurantsState extends State<FavoriteRestaurants> {


  RestaurantFavoritesRepository? _restaurantFavoritesRepository;
  List<Restaurant>? _restaurants;

  initialize() async{ // "?? []" -> si es nulo, devuelve un arreglo vacio
    _restaurants=await _restaurantFavoritesRepository?.getAll()??[];
    setState((){
      _restaurants=_restaurants;
    });
  }

  @override
  void initState(){
    _restaurantFavoritesRepository=RestaurantFavoritesRepository();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
            itemCount: _restaurants?.length ?? 0,
            itemBuilder: ((context, index) {
              final restaurant = _restaurants![index];
              return RestaurantItem(restaurant: restaurant);
            }
            )
        )
    );
  }

}
