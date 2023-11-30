import 'package:ecommerce_app/models/product.dart';
import 'package:sqflite/sqflite.dart';
import '../database/app_database.dart';

class ProductFavoritesRepository{

  //insertar
  Future insert(Product product) async{
    Database db= await AppDatabase().openDb();
    //metodo de pokemon.dart
    db.insert(AppDatabase().tableName, product.toMap());
  }

  //eliminar
  Future delete(Product product) async{
    Database db= await AppDatabase().openDb();
    //metodo de la entidad
    db.delete(AppDatabase().tableName,
        where: "id=?", whereArgs:[product.id]);
  }

  //devuelve si una entidad esta marcada o no como favorita
  Future<bool> isFavorite(Product product) async{
    Database db= await AppDatabase().openDb();
    //metodo de la entidad
    List maps=await db.query(AppDatabase().tableName,
        where: "id=?", whereArgs: [product.id]);

    //maps esta lleno es true, por eso el "isNotEmpty"
    return maps.isNotEmpty;  //devuelve si cierta entidad es o no favorita(se gusrdo o no en el database)
  }

  Future<List<Product>> getAll() async{

    Database db= await AppDatabase().openDb();

    //para un get solo llamar a la database y el nombre de que tabla necesito la informacion
    final maps=await db.query(AppDatabase().tableName);

    //convierto los maps, que se obtienen de la tabla, a objetos Pokemon
    //retorno una lista de ello
    return maps.map((map)=> Product.fromMap(map)).toList();
  }

}