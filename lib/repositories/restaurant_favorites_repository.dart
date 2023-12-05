import 'package:ecommerce_app/database/restaurant_database.dart';
import 'package:ecommerce_app/models/retaurant.dart';
import 'package:sqflite/sqflite.dart';

class RestaurantFavoritesRepository{

  //insertar
  Future insert(Restaurant restaurant) async{
    Database db= await RestaurantDatabase().openDb();
    //metodo de pokemon.dart
    db.insert(RestaurantDatabase().tableName, restaurant.toMap());
  }

  //eliminar
  Future delete(Restaurant restaurant) async{
    Database db= await RestaurantDatabase().openDb();
    //metodo de la entidad
    db.delete(RestaurantDatabase().tableName,
        where: "id=?", whereArgs:[restaurant.id]);
  }

  //devuelve si una entidad esta marcada o no como favorita
  Future<bool> isFavorite(Restaurant restaurant) async{
    Database db= await RestaurantDatabase().openDb();
    //metodo de la entidad
    List maps=await db.query(RestaurantDatabase().tableName,
        where: "id=?", whereArgs: [restaurant.id]);

    //maps esta lleno es true, por eso el "isNotEmpty"
    return maps.isNotEmpty;  //devuelve si cierta entidad es o no favorita(se gusrdo o no en el database)
  }

  Future<List<Restaurant>> getAll() async{

    Database db= await RestaurantDatabase().openDb();

    //para un get solo llamar a la database y el nombre de que tabla necesito la informacion
    final maps=await db.query(RestaurantDatabase().tableName);

    //convierto los maps, que se obtienen de la tabla, a objetos Pokemon
    //retorno una lista de ello
    return maps.map((map)=> Restaurant.fromMap(map)).toList();
  }

}