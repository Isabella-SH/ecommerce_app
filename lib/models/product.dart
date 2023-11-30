
class Product {

  final String name;
  final String category;
  final String gender;
  final List size;
  final List images;
  final List availableColors;

  const Product(
      {required this.name,
        required this.category,
        required this.gender,
        required this.size,
        required this.images,
        required this.availableColors,
      });

  //convuierte de json a objecto
  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        gender = json['gender'],
        size = [],   //vacio para que acepte la lista
        images= json['carousel_images'].map((e)=>e.toString()).toList(),
        availableColors = [];  //vacio para que acepte la lista
}




