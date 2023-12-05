import 'dart:convert';
import 'dart:developer';
import 'dart:io';                               //importar .io
import 'package:ecommerce_app/models/retaurant.dart';
import 'package:http/http.dart' as http;

class RestaurantService{

  final baseUrl="https://plain-marbled-muskox.glitch.me/restaurants";

  //devuelve en algun momento una lista
  Future<List<Restaurant>?> getAll() async{

    http.Response response=await http.get(Uri
        .parse(baseUrl));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);

      //importar el developer, para ver que devuelve el servicio al ejecutar(solo para probar)
      log(response.body);

      final List maps=jsonResponse;

      //cada map es asignado a un objeto Pokemon usando su metodo de fromJson
      //crea una lista de Pokemon
      final restaurants = maps.map((e) => Restaurant.fromJson(e)).toList();

      return restaurants;
    }
    return [];
  }

}







