import 'package:ecommerce_app/screens/favorite_products.dart';
import 'package:ecommerce_app/screens/favorite_restaurants.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/screens/search_products.dart';
import 'package:ecommerce_app/screens/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedTab=0;

  final List<Widget> _children=[
    const SearchProducts(),
    const FavoriteProducts(),
    const Restaurants(),
    const FavoriteRestaurants()
  ];

  _changeTab(int index){
    setState(() {
      _selectedTab=index;
    });
  }

  //navegacion hacia login()
  navigateTo(){
    //pushReplacement->para no retroceder la vista
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      //si el logueo es true pasa a home, sino sigue en login
      return const Login();
    }));
  }

  logout() async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.remove('isLogged');

    //navegar hacia el login despues de desloguear
    navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),

        actions: [
          IconButton(
              onPressed: (){
                logout();     //metodo para desloguearse
              },
              icon: const Icon(Icons.logout)  //simbolo en el appbar para desloguearse
          )
        ],

      ),
      body: _children[_selectedTab],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index)=> _changeTab(index),

        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.add_business), label: "Restaurants"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: "Fav-Rest")
        ],
      ),
    );
  }
}