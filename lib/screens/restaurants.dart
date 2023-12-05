
import 'package:ecommerce_app/widgets/restaurant_list.dart';
import 'package:flutter/cupertino.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return RestaurantList();
  }
}
