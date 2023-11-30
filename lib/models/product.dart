
class Product {

  final String name;
  final String category;
  final String gender;
  final List<String> size;
  final List<String> availableColors;
  final List<String> posters;

  const Product(
      {required this.name,
        required this.category,
        required this.gender,
        required this.size,
        required this.availableColors,
        required this.posters});

  //convuierte de json a objecto
  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        category = json['category'],
        gender = json['gender'],
        size = [],
        availableColors = [],
        posters = [];
}




