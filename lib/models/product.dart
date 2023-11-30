
class Product {

  final int id;
  final String name;
  final String category;
  final String gender;
  final List size;
  final List images;
  final List availableColors;

  const Product(
      {required this.id,
        required this.name,
        required this.category,
        required this.gender,
        required this.size,
        required this.images,
        required this.availableColors,
      });

  //convuierte de json a objecto
  Product.fromJson(Map<String, dynamic> json)
      : id= json['id'],
        name = json['name'],
        category = json['category'],
        gender = json['gender'],
        size = [],   //vacio para que acepte la lista
        images= json['carousel_images'].map((e)=>e.toString()).toList(),
        availableColors = [];  //vacio para que acepte la lista

  //retorna un mapa con los datos que se tenga en esta clase
  //para el repository
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'name':name,
      'category':category,
      'gender':gender,
      'size':size.join(','),
      'images':images.join(','),
      'availableColors':availableColors.join(','),
    };
  }

  //convierte un map a objeto
  //sirve para que convierta lo que devuelve la tabla de nuestra base de datos creada
  //para el getAll()
  /*Product.fromMap(Map<String, dynamic>map):
        id=map['id'],
        name=map["name"],
        images: (map['images'] as List<dynamic>).cast<String>(), // Convertir la lista de imágenes a List<String>
        availableColors=map["availableColors"],
        category=map["category"],
        gender=map["gender"],
        size=map["size"];
*/

  // Método para convertir un mapa en una instancia de Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      gender: map['gender'],
      size: (map['size'] as String)?.split(',')??[],
      images: (map['images'] as String?)?.split(',') ?? [],  // Convertir la cadena de imágenes a una lista
      availableColors: (map['availableColors'] as String)?.split(',')??[],  // Convertir la cadena de colores a una lista
    );
  }
}




