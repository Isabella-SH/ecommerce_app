
class Restaurant {

  final int id;
  final String title;
  final String poster;

  const Restaurant(
      {required this.id,
        required this.title,
        required this.poster,
      });

  //recojemos la informacion de un pokemon de un json
  //claave: recibe primero el tipo de dato
  //dynamic: cualquier valor
  //                    clave,valor                 asi se llama en el json
  Restaurant.fromJson(Map<String, dynamic>json):
        id=json["id"],  //usa la funcion de FUNCTIONS
        title=json["title"],
        poster=json["poster"];


  //retorna un mapa con los datos que se tenga en esta clase
  //para el repository
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title':title,
      'poster':poster,
    };
  }

  //convierte un map a objeto Pokemon
  //sirve para que convierta lo que devuleve la tabla de nuestra base de datos creada
  //para el getAll()
  Restaurant.fromMap(Map<String, dynamic>map):
        id=map['id'],
        title=map["title"],
        poster=map["poster"];

}




