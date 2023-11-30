
import 'dart:convert';
import 'dart:io';                               //importar .io
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService{

  //https://plain-marbled-muskox.glitch.me/shoes

  final String _baseUrl="https://plain-marbled-muskox.glitch.me/shoes";

  //devuelve en algun momento una lista
  Future<List> getAll() async{

    http.Response response=await http.get(Uri.parse(_baseUrl));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //convertir la respuesta en un arreglo
      final List jsonResponse=json.decode(response.body);

      //retorna una lista de todos los objetos
      return jsonResponse.map((e)=> Product.fromJson(e)).toList();
    }
    //sino retorna un arreglo vacio
    return [];
  }


  //devuelve en algun momento una lista
  //devuelve segun un atributo, este se concatena con la _baseurl
  Future<List> getByName(String name) async{

    http.Response response=await http.get(Uri.parse('$_baseUrl?name_like=$name'));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //convertir la respuesta en un arreglo
      final List jsonResponse=json.decode(response.body);

      //retorna una lista de todos los objetos
      return jsonResponse.map((e)=> Product.fromJson(e)).toList();
    }
    //sino retorna un arreglo vacio
    return [];
  }

}



